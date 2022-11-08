#!/bin/bash

nodemon -L --watch . --exec go run main.go --signal SIGTERM --config /var/lib/livego/nodemon.json