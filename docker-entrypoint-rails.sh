#!/bin/bash
set -e

wait-for-it.sh postgres:5432 -s -t 180 -- yarn && ./bin/rails s
