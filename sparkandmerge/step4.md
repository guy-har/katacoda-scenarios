
We will now create a new branch out of master using the branch command

The next command will create a new branch called `my-branch` and his source branch will be `master`
`lakectl branch create lakefs://my-repo@my-branch/ --source lakefs://my-repo@master`{{execute}}


After we created a branch we could the list command to list the branches on owr repository:
`lakectl branch list lakefs://my-repo`{{execute}}

now we could use spark shell and make some changes on our new branch

open spark shell:
`spark-shell`{{execute}}

now in spark shell we will run the next commands:
`val repo = "my-repo"
 val branch = "my-branch"
 val workDir = s"s3a://${repo}/${branch}/imdb"
 val dataPath = s"$workDir/title.episode.tsv.gz"
 val outputPath = s"$workDir/episodes_by_season"
 import org.apache.spark.sql.SparkSession
 val spark = SparkSession.builder.appName("IMDB Loader").getOrCreate()
 spark.sparkContext.hadoopConfiguration.set("fs.s3a.aws.credentials.provider", "com.amazonaws.auth.DefaultAWSCredentialsProviderChain")
 spark.sparkContext.hadoopConfiguration.set("fs.s3a.endpoint", "http://s3.lakefs:8000")
 spark.sparkContext.hadoopConfiguration.set("fs.s3a.path.style.access", "true")
 // convert our TSV input into Parquet, partitioned by the "startYear" field
 import spark.implicits._
 val basics = spark.read.format("csv").option("header", "true").option("delimiter", "\t").load(dataPath)
 basics.toDF().write.partitionBy("seasonNumber").parquet(outputPath)
 spark.stop()`{{execute}}
 
 
 now we could quit running the command:
 `:q`{{execute}}
 