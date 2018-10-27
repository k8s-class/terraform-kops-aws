#!/bin/bash


kops create cluster --topology private \
--zones $ZONES \
--master-zones $ZONES \
--networking flannel \
--node-count 2 \
--master-size t2.small \
--node-size t2.medium \
--image $IMAGE \
--kubernetes-version $KUBEVER \
--api-loadbalancer-type public \
--admin-access 0.0.0.0/0 \
--authorization RBAC \
--ssh-public-key $PUBKEY \
--cloud aws \
--bastion \
--name ${NAME} \
--yes



kops create cluster prod.aheadlabs.io \
   --state=s3://yourbucket \
   --zones=us-east-1a,us-east-1b,us-east-1c \
   --master-zones=us-east-1a,us-east-1b,us-east-1c \
   --networking=calico \
   --kubernetes-version=1.6.2 \
   --master-count=3 \
   --dns=private \
   --master-size=m3.medium \
   --node-size=m4.xlarge \
   --cloud-labels="coveo:billing=infra__mt__kubernetes,coveo:environment=Development" \
   --cloud=aws \
   --topology=public \
   --vpc=vpc-xxxxxxxxx \
   --network-cidr=10.10.0.0/16 \
   --associate-public-ip=false \
   --authorization=RBAC




