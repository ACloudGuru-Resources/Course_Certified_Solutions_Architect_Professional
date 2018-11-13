
/*  
    Shakespeare Insult Flinger
    Version 1
    
    CHANGELOG:
        - Initial version

    USAGE:
        node app.js
        
    By default, will listen on port 8080 if no PORT environment variable is set.
*/

var express = require('express');
var app = express();
var insult = require('shakespeare-insult');
var bodyParser = require('body-parser');
var os = require('os');

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

var port = process.env.PORT || 8080;

app.get('/', function(req,res){
    res.json(
        {
            hostname:os.hostname(),
            version:1,
            insult:insult.random()
        }
    );
})

app.listen(port,function(){
    console.log('Insult v1 app listening on port',port);
})
