# nordcloud

# Solution Proof of Concept Overview

# Diagram
![Diagram](https://github.com/adob71/nordcloud/blob/main/diagram.png)

# AWS  
AWS is the chosen cloud platform.
# Account  
The account holds the environment.
# Components  
The environment consists of the components as follows : 
* (1) CloudFront  
Users access the web site via secure HTTPS and the sessions get routed via the edge cache to the internet gateway.
* (2) InternetGateway  
The sessions get routed via the internet gateway to the load balancer.
* (3) ALB  
The sessions get routed via the load balancer to the running compute instance.
* (4) EC2 Instance AZ1  
The running compute instance hosts the web server (nginx), the application (ghost) and the application runtime (node.js). The running compute instance is placed in the public subnet and security group.
* (5) EC2 Standby AZ2  
The standby compute instance gets launched if the running compute instance fails.
* (6) DB Instance AZ1  
The running database instance hosts the database (mysql) and replicates to the standby database instance. The running database instance is placed in the private subnet and security group.
* (7) DB Standby AZ2  
The standby database instance becomes active if the running database instance fails.
* (8) Cloudwatch  
The performance metrics are collected from the running compute instance and the running database instance.
* (9) CodeCommit  
Developers push the code (ghost) to the git repository.
* (10) CodeBuild  
The code gets built. This component is not required if the code is interpreted (java script).
* (11) CodeDeploy  
The application gets deployed to the running compute instance.
* (12) Lambda
The lambda function deletes all posts.  
Usage :  
aws lambda invoke --function-name delete --payload file://payload.json --cli-binary-format raw-in-base64-out response.json
