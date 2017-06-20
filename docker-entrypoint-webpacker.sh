#!/bin/bash

wait-for-it.sh rails:3000 -s -t 180 -- ./bin/webpack-dev-server
