FROM openjdk:11-jdk-slim
EXPOSE 8090
ADD target/springsecurity-example-0.0.1-SNAPSHOT.jar docker-jenkins.jar
ENTRYPOINT ["java", ".jar", "/docker-jenkins.jar"]