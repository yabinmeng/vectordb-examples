# Overview

This tutorial shows you how to use DataStax Astra DB to build a food recommendation system based on the similarity of historical food review comments. 

## DataSet

The food review dataset used in this tutorial is a subset of the Amazon Fine Food Review dataset that has been preprocessed by OpenAI. The subset can be found at this [OpenAI GitHub link](https://github.com/openai/openai-cookbook/blob/main/examples/data/fine_food_reviews_1k.csv) and the full dataset can be found at this [Kaggle link](https://www.kaggle.com/datasets/snap/amazon-fine-food-reviews).

The food review dataset should be placed in a subfolder called data in the same directory as the Jupyter notebook. For example:
```
$ tree .
.
├── data
│   └── fine_food_reviews_1k.csv
└── food_review_vector.ipyn
```

## Text Embedding Model

The text embedding model used in this tuorial is Google's [Vertex AI Gecko model](https://cloud.google.com/vertex-ai/docs/generative-ai/embeddings/get-text-embeddings), ***textembedding-gecko***, which has an output dimension size of ***768***.

Assuming you have `gcloud CLI` installed and configured (see this [Google doc](https://cloud.google.com/sdk/docs/initializing)), run the following script to verify the connection to the Google Vertex AI service. If the connection is good, you should get a JSON output that includes the text embedding value for the input text.
```
MODEL_ID="textembedding-gecko"
PROJECT_ID=<your_project>
REGION_NAME=<your_region>

curl \
-X POST \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json" \
https://us-central1-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${REGION_NAME}/publishers/google/models/${MODEL_ID}:predict -d \
$'{
  "instances": [
    { "content": "What is life?"}
  ],
}'
```