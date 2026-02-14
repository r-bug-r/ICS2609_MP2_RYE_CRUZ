FROM tomcat:9-jdk8-openjdk-slim

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy webapp content to tomcat ROOT
COPY web /usr/local/tomcat/webapps/ROOT
