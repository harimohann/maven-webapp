FROM centos

MAINTAINER harry452 harimohan123@outlook.com

RUN yum update -y
RUN yum -y install java
RUN java -version

#RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz
RUN tar xzvf apache-tomcat-8.5.73.tar.gz
RUN cp -R /opt/apache-tomcat-8.5.73/ /opt/tomcat

WORKDIR /opt/tomcat/webapps
COPY target/webapp.war .

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
