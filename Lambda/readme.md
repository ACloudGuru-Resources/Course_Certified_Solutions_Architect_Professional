Triggering a Lambda Function in Response to a CloudTrail Log Event
Introduction
In this lab, we are going to go over the process for triggering a Lambda function in response to a CloudTrail event. We will be using a variety of services, including SNS, CloudTrail, S3, Lambda, and SES to accomplish our goal of being notified via email when changes are made within the console. This is important for tracking changes that are made within your AWS account.

Solution
You can copy and paste the code for the Lambda function from this lab's GitHub repository. Be sure to replace the placeholder email addresses in the ToAddresses and Source lines with the actual email addresses you will be using.

Create an S3 Bucket
Log in to the AWS Management Console using the credentials provided on the lab instructions page. Make sure you're using the us-east-1 Region.
In the search bar on top of the console, enter s3.
From the search results, select S3.
Click the Create bucket button.
On the Create bucket page, under Bucket name, enter cloudtraillogsaves.
Leave all other settings as default and click the Create bucket button.
Set Up Your SNS Service
In the search bar on top of the console, enter sns.
From the search results, select Simple Notification Service.
In the Create topic box, under Topic Name, enter Displaytrail.
Click the Next step button.
Leave all settings as default and click the Create topic button.
Create a CloudTrail Log
In the search bar on top of the console, enter cloudtrail.
From the search results, select CloudTrail.
In the left-hand navigation menu, select Trails.
Click the Create trail button.
Under Trail name, enter managementevents.
On the Choose trail attributes page, under Storage location, select Use existing S3 bucket.
Under Trail log bucket name, click the Browse button.
Select the cloudtraillogssaves bucket.
Click the Choose button.
Under Log file SSE-KMS encryption, uncheck the Enabled option.
Under SNS delivery, check the Enabled option.
Under Create a new SNS topic, select Existing.
Under SNS topic, select the existing Displaytrail SNS topic from the dropdown.
Click the Next button.
Ensure the Management events under Event type and Read and Write under API activity are checked.
Click the Next button.
Click the Create trail button.
Create an SES Service
In the search bar on top of the console, enter ses.
From the search results, select Amazon Simple Email Service.
In the left-hand navigation menu, select Verified identities.
Click the Create identity button.
Under Identity type, select Email address.
Under Email address, enter an email address of your own. (It is recommended to use a temporary email address, using a service like Temp Mail.
Click the Create identity button.
Check the inboxes for both email addresses and verify your email address with Amazon SES.
Create and Configure Lambda Function
Create an IAM Role
In the search bar on top of the console, enter iam.
From the search results, select Identity and Access Management.
In the left-hand navigation menu, select Roles.
Click the Create role button.
Under Trusted entity type, select AWS services.
Under Use case, select Lambda.
Click the Next button.
Under Permissions policies, enter s3 to give it access to S3.
Select AmazonS3FullAccess.
Under the fillable field, click the X next to "S3" to clear the filter.
Under Permissions policies, enter Cloudtrail so the role has access to CloudTrail.
Select AWSCloudTrailFullAccess.
Under the fillable field, click the X next to "Cloudtrail" to clear the filter.
Under Permissions policies, enter SES so the role has access to SES.
Select AmazonSESFullAccess.
Under the fillable field, click the X next to "SES" to clear the filter.
Under Permissions policies, enter Lambda so it has access to Lambda.
Select AWSLambda_FullAccess.
Click the Next button.
On the Name, review, and create page, under Role name, enter traillambdarole.
Click the Create role button.
Click the View role to review the new role.
Create the Lambda Function
In the search bar on top, enter lambda.
From the search results, select Lambda.
Click the Create function role.
On the Create function page, set the following parameters:
Function name: Enter traillambdafunc.
Runtime: Select Node.js 16.x.
Execution role: Select Use an existing role.
Existing role: Select traillambdarole from the dropdown menu.
Click the Create function button.
Copy and paste the code for the Lambda function from this lab's GitHub repository into the code box under Code source. Be sure to edit the placeholder email addresses with the temporary email address that you're using for this lab.
Click the Deploy button to verify everything is working correctly.
Add Triggers
Click the + Add trigger button.
In the Select a source dropdown, enter S3.
From the results, select S3.
Under Bucket, select s3/cloudtraillogsaves.
Click the Add button.
Get Your Email
Click the AWS icon in the top left corner to return to the AWS Management Console.
Under Recently visited, select EC2.
Select Instances (running).
Click the Launch an instance button.
On the Launch an instance page, set the following parameters:
Name: Enter Server.
Instance type: Select t3.micro from the dropdown menu.
Key pair (login): Select Proceed without a key pair (not recommended) from the dropdown menu.
Click the Launch instance button.
Once the instance is launched, click the link to the instance in the Success message to view the instance.
After a few minutes, check your temporary and personal email inboxes. You should see emails about cloudtrail.logs start to arrive.
Open and view the email. It should contain the bucket name and the log details saying what happened, as well as the time and date of the change to your bucket.
Conclusion
Congratulations — you've completed this hands-on lab!