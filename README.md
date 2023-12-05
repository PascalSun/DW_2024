# UWA Data Warehousing 2024

## Components

For an end-to-end data warehousing solution, we will be using the following components:

- ETL: [Apache Airflow](https://airflow.apache.org/)[Optional] or Python Scripts
- Data Warehouse/Lakes: [Kylin](https://kylin.apache.org/)
- Data Visualization: [Apache Superset](https://superset.apache.org/)

Data will be feed in via ETL process, get extracted, transformed, and loaded into the data warehouse.
The data warehouse will have a pre-defined schema, for example a star schema, to facilitate data analysis via cubes.
The data visualization tool will be used to query the data warehouse and visualize the data.
With the development of Machine Learning and AI, we are not limited to consume the data via data visualization tools.
We can also use the data warehouse as a data source for Machine Learning and AI.

### Learning outcomes

#### Basic level

- Know how to load data from csv files, extract, transform, and load into a data storage. (ETL)
- Know how to design a data warehouse schema, and implement the cube. (Data Warehouse)
- Know how to query the data warehouse and visualize the data. (Data Visualization)

#### Intermediate level

- Manage the ETL process with Apache Airflow.
- Know how to design a data warehouse schema, and implement the cube. (Data Warehouse)
- Know how to query the data warehouse and visualize the data. (Data Visualization)
- Consumes data from the data warehouse for Machine Learning and AI.

#### Advanced level

Do tech stack selection and set up the end-to-end data warehousing solution for a specific use case.

- The whole solution can be deployed not limited on-premise but can also on cloud.
- The ETL tools can not be limited to Apache Airflow, it can be any other ETL tools.
- The Data Warehouse engine can not be limited to Kylin, it can be any other data warehouse engine, like online
  platforms:
  databricks, snowflake, etc.
- The Data Visualization tools can not be limited to Apache Superset, it can be any other data visualization tools, like
  Tableau, PowerBI, etc.
- The data source can not be limited to csv files, it can be any other data sources, like online data sources: Twitter,
  Facebook, etc. Doing real-time data warehousing.

## Setup

1. Run `docker-compose up` to start the containers.
2. After the container is up, and the logs indicate the Kylin is ready for preview, go
   to http://localhost:7071/kylin/login to
   access Kylin. Username: ADMIN, Password: KYLIN. You will need to wait minutes after the kylin is Ready logs appear.
3. Run `docker exec Kylin5 hive --service hiveserver2`, this is to get hive to allow remote connection. You will need to
   wait minutes after the Hive is Ready to be connected