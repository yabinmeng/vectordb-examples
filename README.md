# Overview

This repository contains a collection of tutorials that show how to use [DataStax Astra DB](https://docs.datastax.com/en/astra-serverless/docs/index.html), a fast and highly scalable vector database for a variety of use cases, including recommendation systems, natural language processing, fraud detection, image recognition, and more.

The list of the tutorials is as below:

| Vector Database | Embedding API | Jupyter Notebook | Description |
| --------------- | ------------- | ---------------- | ----------- |
| Astra DB | Google Vertex AI | [food_review_vector.ipynb](food_review_vector.ipynb) | [document](doc/food_review_vector.md) |


------

To use these tutorials, you first need to register a free-tier Astra account and create an Astra Vector Database. ([Link](https://astra.datastax.com)). Optionally but highly recommended, install [Astra CLI](https://awesome-astra.github.io/docs/pages/astra/astra-cli/#1-installation) to make it easier to configure the connection to the Astra Vector database.

Please **NOTE** that the tutorials in the repository have been tested on a locally installed Jupyter notebook. If you want to run it on a cloud-based Jupyter notebook service, you may need to make some minor changes to the code, such as adding code to upload the required files to the cloud Jupyter notebook instance. The main workflow of the code remains the same, such as getting the embedding values for the food reviews, writing them to the database, and making recommendations by executing similarity-based vector searches.

## Set up and configure the connetion to the Astra Vector database

Assuming you have `Astra CLI` installed and an Astra Vector database (as well as a keyspace) has already been precreated from the Astra Console, 

1) Run the following command to set up the Astra CLI enviornment. The following command is required to set up the Astra CLI environment. Once you have run this command, you will be able to run any other Astra CLI commands.
```
$ astra setup --token <AstraCS_token>
```
*NOTE*: The specified token value must start by *AstraCS:....*. You can get an AstraCS token by following the instructions in this [doc](https://docs.datastax.com/en/astra-serverless/docs/manage/org/manage-tokens.html#_create_application_token). Make sure that you have the *Organization Administrator* role to avoid any permission limitations later on.

2) Run the following command to create a dotenv environment for the database. This environment is stored in a hidden file called .env. and it contains all the system environment variables needed to connect to the database.

```
$ astra db create-dotenv <database_name> -k <keyspace_name>
```

## Start the (local) Juypter instance

Start the local Jupyter instance from the current folder with the following command:
```
jupyter notebook --NotebookApp.iopub_data_rate_limit=1.0e10
```