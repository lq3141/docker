
# bind mount is not good, because of permission error
sudo chown -R 1000:1000 /home/sysadmin/Docker/jenkins
docker run -p 8080:8080 -p 50000:50000 -v /home/jenkins/Docker/jenkins:/var/jenkins_home jenkins/jenkins:lts

# docker volume is much better
docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
