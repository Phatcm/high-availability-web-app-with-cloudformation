#!/bin/bash

REGION="us-east-1"
NETWORK_STACK_NAME="NetworkStack"
SERVER_STACK_NAME="ServerStack"
BASTION_STACK_NAME="BastionHostStack"

# Function to delete a stack
delete_stack() {
    STACK_NAME=$1
    echo "Deleting stack: $STACK_NAME in region $REGION"
    aws cloudformation delete-stack \
        --stack-name "$STACK_NAME" \
        --region "$REGION"
}

# Delete stacks
delete_stack "$BASTION_STACK_NAME"
delete_stack "$SERVER_STACK_NAME"
delete_stack "$NETWORK_STACK_NAME"

echo "All stacks are being deleted. Use 'aws cloudformation describe-stacks --region $REGION' to check status."
