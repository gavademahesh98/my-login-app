FROM  maven:3.8.6-openjdk-8-slim AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests


FROM tomcat:9
WORKDIR /usr/local/tomcat/webapps/
COPY --from=builder /app/target/*.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]