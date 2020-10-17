#!/bin/bash -eu
TYPE=runner_v2
# define with your project and bucket for staging the template
PROJECT=${PROJECT}
STAGING_BUCKET=${BUCKET}
REGION="asia-northeast1"

# Working directories for dataflow
STAGING_BUCKET_PATH="gs://${STAGING_BUCKET}"

STAGING_LOCATION="$STAGING_BUCKET_PATH/staging"
TEMP_LOCATION="$STAGING_BUCKET_PATH/temp"

# Running Config for Dataflow
RUNNER=DataflowRunner

TEMPLATE_LOCATION="${STAGING_BUCKET_PATH}/templates/${TYPE}"

python3 run_pipeline.py \
  --project=$PROJECT \
  --runner=$RUNNER \
  --staging_location=$STAGING_LOCATION \
  --temp_location=$TEMP_LOCATION \
  --template_location=$TEMPLATE_LOCATION \
  --requirements_file=requirements.txt \
  --region=$REGION \
  --experiments=use_runner_v2
  
