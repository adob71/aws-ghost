from diagrams import Diagram, Cluster, Edge
from diagrams.aws.network import VPC, CloudFront, InternetGateway, ALB
from diagrams.aws.compute import EC2AutoScaling, EC2Instance
from diagrams.aws.database import RDS
from diagrams.aws.devtools import Codepipeline, Codecommit, Codebuild, Codedeploy
from diagrams.aws.management import OrganizationsAccount, Cloudwatch
from diagrams.aws.general import Users

with Diagram("Diagram", direction="TB", show=False):

    DevOps = Users("DevOps")
    Users = Users("Users")

    with Cluster("AWS"):

        with Cluster("Account"):

            with Cluster("VPC"):
                CloudFront = CloudFront("(1) CloudFront")
                InternetGateway = InternetGateway("(2) InternetGateway")
                ALB = ALB("(3) ALB")

                with Cluster("EC2AutoScaling"):
                    EC2Instance = [EC2Instance("(4) EC2 Instance AZ1"), EC2Instance("(5) EC2 Standby AZ2")]
#                EC2Instance[0] >> Edge(color="red", style="dashed", label="Failover") >> EC2Instance[1]

                with Cluster("RDS"):
                    RDS = [RDS("(6) DB Instance AZ1"), RDS("(7) DB Standby AZ2")]      
#                RDS[0] >> Edge(color="red", style="dashed", label="Replicate") >> RDS[1]

                Users >> CloudFront >> InternetGateway >> ALB >> EC2Instance[0] >> RDS[0]

            with Cluster("CloudWatch"):
                Cloudwatch = Cloudwatch("(8) CloudWatch")

                EC2Instance[0] >> Cloudwatch
#                RDS[0] >> Cloudwatch

            with Cluster("CodePipeline"):
                Codecommit = Codecommit("(9) CodeCommit")
                Codebuild = Codebuild("(10) CodeBuild")
                Codedeploy = Codedeploy("(11) CodeDeploy")

                DevOps >> Codecommit >> Codebuild >> Codedeploy >> EC2Instance[0]
