FROM ubuntu:12.04
MAINTAINER Chris Meadows, "chris@meadows.com"
#ENV http_proxy http://proxy.dev.worldpay.com:8080
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.560/jenkins.war /opt/jenkins.war
RUN ln -sf /jenkins /root/.jenkins
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
