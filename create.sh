#!/bin/bash

REGION="us-east-1"
NETWORK_STACK_NAME="NetworkStack"
SERVER_STACK_NAME="ServerStack"
BASTION_STACK_NAME="BastionHostStack"
NETWORK_TEMPLATE="network.yml"
SERVER_TEMPLATE="server.yml"
BASTION_TEMPLATE="bastion-host.yml"
NETWORK_PARAMETERS="network-parameters.json"
SERVER_PARAMETERS="server-parameters.json"
BASTION_PARAMETERS="bastion-host-parameters.json"

# Function to create a stack
create_stack() {
    STACK_NAME=$1
    TEMPLATE_FILE=$2
    PARAMETERS_FILE=$3
    
    echo "Creating stack: $STACK_NAME in region $REGION"
    aws cloudformation create-stack \
        --stack-name "$STACK_NAME" \
        --template-body "file://$TEMPLATE_FILE" \
        --parameters "file://$PARAMETERS_FILE" \
        --capabilities CAPABILITY_NAMED_IAM \
        --region "$REGION"
}

# Create stacks
create_stack "$NETWORK_STACK_NAME" "$NETWORK_TEMPLATE" "$NETWORK_PARAMETERS"
create_stack "$SERVER_STACK_NAME" "$SERVER_TEMPLATE" "$SERVER_PARAMETERS"
create_stack "$BASTION_STACK_NAME" "$BASTION_TEMPLATE" "$BASTION_PARAMETERS"

echo "All stacks are being created. Use 'aws cloudformation describe-stacks --region $REGION' to check status."
