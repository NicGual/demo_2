module alb {
  source             = "../modules/alb"

  APP_NAME           = var.PROJECT_NAME
  ALB_SECURITY_GROUP = aws_security_group.alb-sg.id
  PUBLIC_SUBNET_1_ID = aws_subnet.main-public-vpc.id
  PUBLIC_SUBNET_2_ID = aws_subnet.main-public-vpc-2.id
  VPC_ID             = aws_vpc.main-application-vpc.id
  TARGET_INSTANCES   = [aws_instance.machine-1.public_ip,aws_instance.machine-2.public_ip,aws_instance.machine-3.public_ip]
  #CERTIFICATE_ARN    = 
}
