from diagrams import Diagram, Cluster
from diagrams.aws.network import VPC, InternetGateway, ALB
from diagrams.aws.compute import EC2AutoScaling, EC2Instance
from diagrams.aws.database import RDS
from diagrams.aws.devtools import Codepipeline, Codecommit, Codebuild, Codedeploy
from diagrams.aws.management import Cloudwatch


with Diagram("Diagram", direction="LR", show=False):

    with Cluster("AWS"):

        with Cluster("VPC"):
            InternetGateway = InternetGateway("InternetGateway")
            ALB = ALB("ALB")
            EC2AutoScaling = EC2AutoScaling("EC2AutoScaling")
            with Cluster("EC2Instance"):
                EC2Instance = [EC2Instance("EC2 Instance AZ1"), EC2Instance("EC2 Standby AZ2")]
            with Cluster("RDS"):
                RDS = [RDS("DB Instance AZ1"), RDS("DB Standby AZ2")]      
            InternetGateway >> ALB >> EC2AutoScaling >> EC2Instance[0] >> RDS[0]

        with Cluster("CodePipeline"):
            Codecommit = Codecommit("CodeCommit")
            Codebuild = Codebuild("CodeBuild")
            Codedeploy = Codedeploy("CodeDeploy")
            Codecommit >> Codebuild >> Codedeploy >> EC2Instance[0]

        with Cluster("CloudWatch"):
            Cloudwatch = Cloudwatch("CloudWatch")
            EC2Instance[0] >> Cloudwatch

