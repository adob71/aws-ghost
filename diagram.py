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
                CloudFront = CloudFront("(6) CloudFront")
                InternetGateway = InternetGateway("(7) InternetGateway")
                ALB = ALB("(8) ALB")
                with Cluster("EC2AutoScaling"):
                    EC2Instance = [EC2Instance("(4) EC2 Instance AZ1"), EC2Instance("(10) EC2 Standby AZ2")]
                with Cluster("RDS"):
                    RDS = [RDS("(5) DB Instance AZ1"), RDS("(11) DB Standby AZ2")]      
                Users >> CloudFront >> InternetGateway >> ALB >> EC2Instance[0] >> RDS[0]

            with Cluster("CloudWatch"):
                Cloudwatch = Cloudwatch("(9) CloudWatch")
                EC2Instance[0] >> Cloudwatch

            with Cluster("CodePipeline"):
                Codecommit = Codecommit("(1) CodeCommit")
                Codebuild = Codebuild("(2) CodeBuild")
                Codedeploy = Codedeploy("(3) CodeDeploy")
                DevOps >> Codecommit >> Codebuild >> Codedeploy >> EC2Instance[0]
