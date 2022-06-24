### System Overview  

### Architecture  
![Diagram](https://github.com/adob71/aws-ghost/blob/main/diagram.png)  

### Components  
* (1) CloudFront  
Users access ghost from the web browser using secure HTTPS via the edge cache whereby the sessions get routed to the internet gateway.  
* (2) InternetGateway  
The sessions get routed from the internet gateway to the load balancer.  
* (3) ALB  
The sessions get routed from the load balancer to the running compute instance.  
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
The code gets built. This component is not required if the code is interpreted (JS).  
* (11) CodeDeploy  
The code gets deployed to the running compute instance.  
* (12) LambdaFunction  
The serverless function deletes the posts in ghost (JS + ghost SDK).  
```
$ aws lambda invoke --function-name delete --payload fileb://payload.json response.json  
```

### Deployment
```
$ terraform apply
```

### Decommissioning
```
$ terraform destroy
```

### Project Structure
```
.
├── asg.tf
├── cf.tf
├── delete.zip
├── diagram.png
├── diagram.py
├── ghost-client.js
├── iam.tf
├── index.js
├── init.sh
├── lb.tf
├── lf.tf
├── node_modules
│   └── @tryghost
│       └── admin-api
│           ├── index.js
│           ├── lib
│           │   ├── admin-api.js
│           │   └── token.js
│           ├── LICENSE
│           ├── package.json
│           └── README.md
├── package-lock.json
├── payload.json
├── provider.tf
├── rds.tf
├── README.md
├── response.json
├── terraform.tfstate
├── terraform.tfstate.backup
├── variables.tf
└── vpc.tf
```
