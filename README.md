# nordcloud

# Proof of Concept

# Diagram
![Diagram](https://github.com/adob71/nordcloud/blob/main/diagram.png)

# Components :
# AWS
# OrganizationsAccount
# VPC
* CloudFront
* InternetGateway
* ALB
* EC2AutoScaling
* EC2 Instance AZ1
* EC2 Standby AZ2
* RDS
* DB Instance AZ1
* DB Standby AZ2
* Users >> CloudFront >> InternetGateway >> ALB >> EC2Instance[0] >> RDS[0]

# CodePipeline
* CodeCommit
* CodeBuild
* CodeDeploy
* DevOps >> Codecommit >> Codebuild >> Codedeploy >> EC2Instance[0]

# CloudWatch
* EC2Instance[0] >> Cloudwatch

