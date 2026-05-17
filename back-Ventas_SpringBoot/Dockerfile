# build
FROM maven:3.8.8-jakartaee10 AS builder
WORKDIR /app

# archivo de configuracion de dependencias
COPY pom.xml .

# descargar dependencias (esto se cacheará si no cambia el pom.xml, acelerando futuras compilaciones)
RUN mvn dependency:go-offline -B

# codigo fuente de la aplicacion
COPY src ./src

# archivo .jar sin test
RUN mvn package -DskipTests

# run - etapa 2
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# crear usuario
RUN adduser -D userEval

# copia del .jar generado
COPY --from=builder /app/target/*.jar app.jar

RUN chown -R userEval:userEval /app

USER userEval

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]