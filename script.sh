#!/bin/bash

#cd /opt/

#FLASK_APP=/opt/app.py 
cd /var/lib/jenkins/workspace/Flask_deployment/

FLASK_APP=app.py

nohup flask run --host=0.0.0.0 &
