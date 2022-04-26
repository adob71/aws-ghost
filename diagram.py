from diagrams import Diagram, Cluster
from diagrams.aws.network import VPC, CloudFront, InternetGateway, ALB
from diagrams.aws.compute import EC2AutoScaling, EC2Instance
from diagrams.aws.database import RDS
from diagrams.aws.devtools import Codepipeline, Codecommit, Codebuild, Codedeploy
from diagrams.aws.management import OrganizationsAccount, Cloudwatch
from diagrams.aws.general import Users

with Diagram("Diagram", direction="LR", show=False):

    DevOps = Users("DevOps")
    Users = Users("Users")

    with Cluster("AWS"):

        with Cluster("OrganizationsAccount"):

            with Cluster("VPC"):
                CloudFront = CloudFront("CloudFront")
                InternetGateway = InternetGateway("InternetGateway")
                ALB = ALB("ALB")
                with Cluster("EC2AutoScaling"):
                    EC2Instance = [EC2Instance("EC2 Instance AZ1"), EC2Instance("EC2 Standby AZ2")]
                with Cluster("RDS"):
                    RDS = [RDS("DB Instance AZ1"), RDS("DB Standby AZ2")]      
                Users >> CloudFront >> InternetGateway >> ALB >> EC2Instance[0] >> RDS[0]

            with Cluster("CodePipeline"):
                Codecommit = Codecommit("CodeCommit")
                Codebuild = Codebuild("CodeBuild")
                Codedeploy = Codedeploy("CodeDeploy")
                DevOps >> Codecommit >> Codebuild >> Codedeploy >> EC2Instance[0]

            with Cluster("CloudWatch"):
                Cloudwatch = Cloudwatch("CloudWatch")
                EC2Instance[0] >> Cloudwatch
