/* Creates a table referencing a directory full of nested JSON files */

CREATE EXTERNAL TABLE `air_quality`(
  `date` struct<utc:string,local:string> COMMENT 'from deserializer', 
  `parameter` string COMMENT 'from deserializer', 
  `location` string COMMENT 'from deserializer', 
  `value` double COMMENT 'from deserializer', 
  `unit` string COMMENT 'from deserializer', 
  `city` string COMMENT 'from deserializer', 
  `attribution` array<struct<name:string,url:string>> COMMENT 'from deserializer', 
  `coordinates` struct<latitude:double,longitude:double> COMMENT 'from deserializer', 
  `country` string COMMENT 'from deserializer', 
  `sourcename` string COMMENT 'from deserializer', 
  `sourcetype` string COMMENT 'from deserializer', 
  `mobile` boolean COMMENT 'from deserializer', 
  `averagingperiod` struct<unit:string,value:double> COMMENT 'from deserializer')
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
WITH SERDEPROPERTIES ( 
  'paths'='attribution,averagingPeriod,city,coordinates,country,date,location,mobile,parameter,sourceName,sourceType,unit,value') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://openaq-fetches/realtime/2018-10-09/'
TBLPROPERTIES (
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='aq2', 
  'averageRecordSize'='1005', 
  'classification'='json', 
  'compressionType'='none', 
  'objectCount'='117', 
  'recordCount'='309720', 
  'sizeKey'='317032303', 
  'typeOfData'='file');