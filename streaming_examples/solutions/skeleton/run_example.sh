#!/bin/bash -e

cat payments.csv | ./mapper.py | sort | ./reducer.py

