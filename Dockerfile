FROM eclipse-temurin:25-alpine
LABEL maintainer="sebastianbuitragoq@gmail.com"
COPY /target/*.jar /home/spring-petclinic.jar
CMD ["java","-jar","/home/spring-petclinic.jar"]
EXPOSE 8080
