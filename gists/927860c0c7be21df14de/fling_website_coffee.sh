#!/usr/bin/env coffee

request = require "request"

HOST     = process.argv[3] || "localhost"
URL      = "http://" + HOST + ":9431/apps/"
APP_ID   = "~browser"
APP_URL  = URL + APP_ID
OPEN_URL = process.argv[2] || "http://gbraad.nl"

cmd =
    type: "launch"
    app_info:
        url: OPEN_URL,
        useIpc: false,
        maxInactive: 0

option =
    url: APP_URL
    method: "POST"
    json: cmd

request option, (error, response, body) =>
    console.log "POST #{APP_URL}"
    if error?
        console.log "error!!! #{error}"
    else
        console.log body