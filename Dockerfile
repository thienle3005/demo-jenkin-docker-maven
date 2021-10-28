FROM openjdk:8
EXPOSE 8080
ADD target/jenkin.jar jenkin.jar
ENTRYPOINT ["java","-jar","/jenkin.jar"]