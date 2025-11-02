FROM openjdk:21-slim

WORKDIR /app

COPY target/employee-management-system-0.0.1-SNAPSHOT.war app.war

EXPOSE 8000

ENTRYPOINT ["java", "-jar", "app.war"]