Design Infrastructure Solution

CRITERIA
MEETS SPECIFICATIONS
Develop a schematic for the application development project

The infrastructure includes:

Infrastructure in the following regions: us-east-1
Users and Client machines
One VPC
Two Availability Zones
Four Subnets (2 Public, 2 Private)
A NAT Gateway
A CloudFront distribution with an S3 Bucket
Web servers in the Public Subnets
Application Servers in the Private Subnets
DB Servers in the Private Subnets
Web Servers Load Balanced and Autoscaled
Application Servers Load Balanced and Autoscaled
A Master DB in AZ 1 with a read replica in AZ2
All services in the diagram include a label to indicate the type of service and any necessary parameters (e.g. size, location)

Visible lines represent all network connections

Develop a schematic for a Serverless AWS infrastructure application development project

The infrastructure includes:

A user and client machine
AWS Route 53
A CloudFront Distribution
AWS Cognito
AWS Lambda
API Gateway
DynamoDB
S3 Storage
All services in the diagram include a label to indicate the type of service and any necessary parameters (e.g. size, location)

Visible lines represent all network connections

Estimate Costs

CRITERIA
MEETS SPECIFICATIONS
Estimate the monthly cost of the planned infrastructure for Diagram 1

The monthly cost is between $8,000-10,000 using the AWS Pricing Calculator

Modify the infrastructure to reduce the monthly cost

The infrastructure includes all required services to run properly

The monthly cost is $6,500 or below using the AWS Pricing Calculator

A rationale is provided to explain which services were changed or removed

Modify the infrastructure to increase performance and redundancy

Infrastructure has been re-designed for increased performance and redundancy

The monthly cost is between $18,000-20,000 using the AWS Pricing Calculator

A rationale is provided to explain which services were changed or removed

Configure AWS Monitoring and Billing

CRITERIA
MEETS SPECIFICATIONS
Configure a CloudWatch Billing Alarm

A billing alarm is configured to send an alarm to a valid email address when a $5 billing threshold is met
The billing alarm has a status of GREEN OK after a refresh period of 5-10 minutes
Create and Configure IAM Users and Groups

A group named CloudTrailAdmins has been created and has the two CloudTrail privileges.
A group named Reviewers has been created and has the Billing privilege.
A user named CloudTrail is created and assigned to the CloudTrailAdmins group.
A user named Accountant is created and assigned to the Reviewers group.
Both users have AWS Console access
Update AWS password policy

Password policy meets or exceeds these requirements:

Minimum password length = 8
Require at least one uppercase letter
Require at least one lowercase letter
Require at least one number
Require at least one non-alphanumeric character.
Infrastructure as Code with Terraform

CRITERIA
MEETS SPECIFICATIONS
Provision AWS Infrastructure as Code with Terraform

AWS Console EC2 screenshot Terraform_1_1 shows:

4 AWS t2.micro EC2 instances named Udacity T2
2 m4.large EC2 instances named "Udacity M4"
Updated AWS Console EC2 screenshot Terraform_1_2 shows:

4 AWS t2.micro EC2 instances named "Udacity T2"
Deploy an AWS Lambda function using Terraform

Infrastructure includes:

A lambda.py file
A main.tf file
An outputs.tf file
A variables.tf file
AWS CloudWatch log screenshot Terraform_2_3 shows the CloudWatch log entry that correlates to the lambda function

Delete and Destroy AWS Infrastructure Resources with Terraform

All infrastructure provisioned with Terraform is deleted/ destroyed using the *.tf configuration files



# Cloud Developer ND Course 2: Design for Performance and Scalability

---

## Project  Instructions

### Exercise 1

1. Download the [starter code](https://github.com/udacity/cand-c2-project).
2. In the main.tf file write the code to provision
   * AWS as the cloud provider
   * Use an existing VPC ID
   * Use an existing public subnet
   * 4 AWS t2.micro EC2 instances named Udacity T2
   * 2 m4.large EC2 instances named Udacity M4
3. Run Terraform. 
4. Take a screenshot of the 6 EC2 instances in the AWS console and save it as `Terraform_1_1`. 
5. Use Terraform to  delete the 2 m4.large instances 
6. Take an updated screenshot of the AWS console showing only the 4 t2.micro instances and save it as `Terraform_1_2`

### Exercise 2

1. In the  Exercise_2 folder, write the code to deploy an AWS Lambda Function using Terraform. Your code should include:

   * A lambda.py file
   * A main.tf file with AWS as the provider, and IAM role for Lambda, a VPC, and a public subnet
   * An outputs.tf file
   * A variables.tf file with an AWS region
  
2. Take a screenshot of the EC2 instances page
3. Take a screenshot of the VPC page 
