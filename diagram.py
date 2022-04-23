from diagrams import Cluster, Diagram
from diagrams.aws.network import InternetGateway, ALB
from diagrams.aws.compute import EC2AutoScaling, EC2Instance
from diagrams.aws.database import RDS

with Diagram("Diagram", direction="TB", show=False):
  with Cluster("AWS"):
    IGW = InternetGateway("IGW")
    with Cluster("VPC"):
      LB = ALB("LB")
      ASG = EC2AutoScaling("ASG")
      with Cluster("EC2"): 
        EC2Instance = [EC2Instance("nginx+ghost AZ1"), EC2Instance("nginx+ghost AZ2")]
      with Cluster("RDS"):
        RDS = [RDS("mysql AZ1"), RDS("mysql AZ2")]
    IGW >> LB >> ASG >> EC2Instance[0] >> RDS[0]
