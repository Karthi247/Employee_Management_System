FROM openjdk:21-slim

WORKDIR /app

COPY target/*.war app.war

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "app.war"]