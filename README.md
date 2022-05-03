# nordcloud

# Proof of Concept

# Diagram
![Diagram](https://github.com/adob71/nordcloud/blob/main/diagram.png)

# AWS  
AWS is the chosen cloud platform
# OrganizationsAccount  
The account holds the environment
# Components  
The environment consists of components : 
* (1) CloudFront  
Users access the web site and the sessions get routed via the edge cache to the internet gateway
* (2) InternetGateway  
The sessions gets routed via the internet gateway to the load balancer
* (3) ALB  
The sessions gets routed via the load balancer to the running compute instance
* (4) EC2 Instance AZ1  
The running compute instance hosts the web server, the application and the application runtime
* (5) EC2 Standby AZ2  
The standby compute instance gets launched if the running compute instance fails
* (6) DB Instance AZ1  
The running database instance hosts the database and replicates to the standby database
* (7) DB Standby AZ2  
The standby database instance gets activated if the running database instance fails
* (8) Cloudwatch  
The performance metrics are collected
* (9) CodeCommit  
Developers push the code to the repository
* (10) CodeBuild  
The code gets built into the application
* (11) CodeDeploy  
The application gets deployed to the running compute instance
