module alb {
  source             = "../modules/alb"

  APP_NAME           = var.PROJECT_NAME
  ALB_SECURITY_GROUP = aws_security_group.alb-sg.id
  PUBLIC_SUBNET_1_ID = aws_subnet.main-public-vpc.id
  PUBLIC_SUBNET_2_ID = aws_subnet.main-public-vpc-2.id
  VPC_ID             = aws_vpc.main-application-vpc.id
  #CERTIFICATE_ARN    = 
}
