# my-hometask

The repo contains:
1. main.py - python file that prints "Devops is great"
2. Dockerfile - contains the layers of the image that we're going to build from python file
3. Dockerfile-jenkins - Dockerfile-jenkins - contains the layers of the jenkins image we're going to build
4. docker-compose.yml - file that contains the properties of jenkins container and runs it
5. Jenkinsfile - file that contains the jenkins job
6. install-plugins.sh - bash script that install the plugins in jenkins image, used in Dockerfile-jenkins
7. plugins.txt - plugin names, used in Dockerfile-jenkins file
8. config.xml - xml file that contains the jenkins job, used in Dockerfile-jenkins

What you need to do to make it work?
1. Run the docker-compose.yml file with the command docker-compose up -d
2. Make some changes in main.py file and commit it to the git repository
