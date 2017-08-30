#!/usr/bin/env node

var request = require("request");

var HOST     = process.argv[3] || "localhost";
var URL      = "http://" + HOST + ":9431/apps/";
var APP_ID   = "~browser";
var APP_URL  = URL + APP_ID;
var OPEN_URL = process.argv[2] || "http://gbraad.nl";

var cmd = {
    type: "launch",
    app_info: {
        url: OPEN_URL,
        useIpc: false,
        maxInactive: 0
    }
};

var option = {
    url: APP_URL,
    method: "POST",
    json: cmd
};

request(option, function(error, response, body) {
    console.log("POST " + APP_URL)
    if(error)
        console.log("error!!! " + error)
    else
        console.log(body)
});
