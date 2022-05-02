# nordcloud

# ASSIGNMENT FOR THE TECHNICAL INTERVIEW

# CLOUD ARCHITECT

# Deliverables
* The solution must be delivered using a private git repository on GitHub or GitLab. Make sure to add the user @nc-tech-review as a collaboratorto the repository.
* All the code related to your implementation, in aform that is deployable by the interviewer.
* Comprehensive and understandable documentation ofyour solution.
* Presentation of your solution during the followingtechnical interview.

# Acceptance Criteria
* The application should be able to scale dependingon the load.
* There should be no obvious security flaws.
* The application must return consistent results acrosssessions.
* The implementation should be built in a resilientmanner.
* Observability must be taken into account when implementingthe solution.
* The deployment of the application and environmentshould be automated.

# Requirements
* During their ongoing modernization process, they decidedthey want to use the Ghost Blog platform for their marketing efforts.
* It is expected that during the newproduct launch or marketing campaigns there could be increases of up to 4 times the typical load.
* It is crucial that the platform remains online even in case of a significant geographicalfailure. 
* The customer is also interested in disaster recovery capabilities in case of a regionfailure.
* the customer plans to have 5 DevOps teams working on the project. 
* The teams want to beable to release new versions of the application multiple times per day, without requiringany downtime. 
* The customer wants to have multiple separated environments to support theirdevelopment efforts.
* As they are also tasked with maintaining the environmentthey need tools to support their operations and help them with visualising and debuggingthe state of the environment..
* The website will be exposed to the internet, thusthe security team also needs to have visibility into the platform and its operations.
* Thecustomer has also asked for the ability to delete all posts at once using a serverless function.

# Solution Proof of Concept

# Solution Diagram
![Diagram](https://github.com/adob71/nordcloud/blob/main/diagram.png)

# Solution Components :
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

