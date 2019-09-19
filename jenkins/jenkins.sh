
sudo chown -R 1000:1000 /home/sysadmin/Docker/jenkins
docker run -p 8080:8080 -p 50000:50000 -v /home/jenkins/Docker/jenkins:/var/jenkins_home jenkins/jenkins:lts

