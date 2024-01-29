**Copy files from S3 to EFS using Lambda function**

✨In this repository we are going to implement one of the scenario based question to dynamically copy files from S3 to EFS filesystem using AWS Lambda Function 

**Detail about this project:**

Consider we are in scenario where end user will upload a raw data files to S3 bucket, which needs to get processed further by EC2 instance.  So here we deployed a lambda function which has the python code to copy files from the S3 bucket and paste it in EFS Filesystem.  

We are reviewing this copy mechanism using CloudWatch Log group and EC2 instance.  Instance is launched in Same VPC and get mounted to EFS using User Data.



**🏠 Architecture**

<img width="522" alt="image" src="https://github.com/logesh81098/copy-files-from-S3-to-EFS-using-lambda/assets/83343125/45f5df84-0be5-49f7-9dda-00adb2617cbd">



**📃 list of services**
1.AWS VPC (Networking Block)
2.AWS S3 (Source)
3.AWS EFS (Destination)
4.AWS Lambda Function (Computing service to copy files between S3 and Lambda)
5.AWS Security group (Connecting component between EFS & Lambda and EFS and EC2 instance)
6.AWS IAM Role (Controlling access permission between resources)
7.AWS EC2 instance (Computing service used to review copy process)

**✈️ Now we are ready to deploy our application on cloud ⛅**
Clone this repository to your local machine using 
gitclone https://github.com/logesh81098/copy-files-from-S3-to-EFS-using-lambda.git

Execute Terraform plan to check about infrastructure 
terraform apply

Execute Terraform apply to build this infrasturcute 
terraform apply 

✨Finally,type yes for prompt 
Thank you so much for reading..😅 
Happy learning !!!!!!!
