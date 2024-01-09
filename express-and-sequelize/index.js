var express = require('express');
const { connectToDatabase } = require('./database/database');
var app = express()

app.get("/welcome", function(req, res){
    res.send("Hello, world!");
});

connectToDatabase()

app.listen(3000)