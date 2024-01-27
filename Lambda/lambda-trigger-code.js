const aws =  require("aws-sdk");
const sns = new aws.SNS({
region:'us-east-1'
});
var ses = new aws.SES({
   region: 'us-east-1'
});
exports.handler = function(event, context, callback) {
   console.log("AWS lambda and SNS trigger ");
   console.log(event);
   const s3message = "Bucket Name:"+event.Records[0].s3.bucket.name+"\nLog details:"+event.Records[0].s3.object.key;
   console.log(s3message);
   var eParams = {
      Destination: {
         ToAddresses: ["xxxxxxxxx12@gmail.com"] //replace with your destination email address
      },
      Message: {
         Body: {
            Text: {
               Data:s3message
            }
         },
         Subject: {
            Data: "cloudtrail logs"
         }
      },
      Source: "coxxxxxx@gmail.com" //replace with your sender email address
   };
   var email = ses.sendEmail(eParams, function(err, data) {
      if (err) console.log(err);
      else {
         console.log("===EMAIL SENT===");
         console.log("EMAIL CODE END");
         console.log('EMAIL: ', email);
         context.succeed(event);
         callback(null, "email is send");
      }
   });
};
