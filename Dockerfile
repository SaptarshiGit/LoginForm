FROM openjdk:11
EXPOSE 8090
ADD target/docker-jenkins.jar docker-jenkins.jar
ENTRYPOINT ["java", ".jar", "/docker-jenkins.jar"]