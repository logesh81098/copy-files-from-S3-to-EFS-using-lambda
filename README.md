**Copy files from S3 to EFS using Lambda function**

&nbsp; &nbsp; ✨In this repository we are going to implement one of the scenario based question to dynamically copy files from S3 to EFS filesystem using AWS Lambda Function 

**Detail about this project:**

&nbsp; &nbsp; Consider we are in scenario where end user will upload a raw data files to S3 bucket, which needs to get processed further by EC2 instance.  So here we deployed a lambda function which has the python code to copy files from the S3 bucket and paste it in EFS Filesystem.  

 &nbsp; &nbsp; We are reviewing this copy mechanism using CloudWatch Log group and EC2 instance.  Instance is launched in Same VPC and get mounted to EFS using User Data.



**🏠 Architecture**

<img width="522" alt="image" src="https://github.com/logesh81098/copy-files-from-S3-to-EFS-using-lambda/assets/83343125/45f5df84-0be5-49f7-9dda-00adb2617cbd">


**📃 list of services**

 &nbsp; &nbsp; &nbsp; 1.AWS VPC (Networking Block)

 &nbsp; &nbsp; &nbsp; 2.AWS S3 (Source)

 &nbsp; &nbsp; &nbsp; 3.AWS EFS (Destination)

 &nbsp; &nbsp; &nbsp; 4.AWS Lambda Function (Computing service to copy files between S3 and Lambda)

 &nbsp; &nbsp; &nbsp; 5.AWS Security group (Connecting component between EFS & Lambda and EFS and EC2 instance)

 &nbsp; &nbsp; &nbsp; 6.AWS IAM Role (Controlling access permission between resources)

 &nbsp; &nbsp; &nbsp; 7.AWS EC2 instance (Computing service used to review copy process)

**✈️ Now we are ready to deploy our application on cloud ⛅**

Clone this repository to your local machine using 

 &nbsp; &nbsp; &nbsp; gitclone https://github.com/logesh81098/copy-files-from-S3-to-EFS-using-lambda.git

Execute Terraform plan to check about infrastructure 

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; **terraform plan**

Execute Terraform apply to build this infrasturcute 

 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; **terraform apply**

✨Finally,type yes for prompt 


**Output**

<img width="764" alt="image" src="https://github.com/logesh81098/copy-files-from-S3-to-EFS-using-lambda/assets/83343125/0609ac9d-30d7-4c8f-acd6-3683d001db72">


&nbsp; &nbsp; **Content of the first object: Alexa play : Kanmani anbodu kadhalan naan eluthum kadithamae**

&nbsp; &nbsp; **List, download, store in /tmp, and copy to EFS completed**

Thank you so much for reading..😅 

Happy learning !!!!!!!
