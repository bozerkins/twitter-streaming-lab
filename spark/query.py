from __future__ import print_function

import sys
import os
import requests
import json
from pyspark.sql import SparkSession
from pyspark.sql import SQLContext


if __name__ == "__main__":

    spark = SparkSession\
        .builder\
        .appName("MoveApp")\
        .getOrCreate()

    response = requests.get("http://192.168.50.11:8983/solr/tweets/select?fl=id,%20lang&q=*:*&rows=10000");
    prepare = []
    for record in json.loads(response.text)['response']['docs']:
        record['lang'] = record['lang'][0]
        prepare.append(json.dumps(record))

    rdd = spark.sparkContext.parallelize(prepare)

    df = spark.read.json(rdd)
    df.createOrReplaceTempView("tweets")

    spark.sql("SELECT lang as language, count(*) as amount FROM tweets GROUP BY 1 ORDER BY 2 DESC").show()


    # df = spark.read.json(records.text.toDS)
    #

    spark.stop()
