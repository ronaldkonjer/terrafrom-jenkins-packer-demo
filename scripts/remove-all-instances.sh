#!/bin/bash
for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing Instances in region:'$region'..."
     aws configure set region $region
     for instanceid in `aws ec2 describe-instances --region $region | jq -r '.Reservations[] | ( .Instances[] | .InstanceId)'`
     do
     	aws ec2 modify-instance-attribute --instance-id $instanceid --no-disable-api-termination
     	aws ec2 terminate-instances --instance-ids  $instanceid 
     done
done