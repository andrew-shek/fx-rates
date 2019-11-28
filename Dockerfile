FROM java:8
EXPOSE 8080
ADD /build/libs/fx-rates-0.0.1-SNAPSHOT.jar fx-rates-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar“,"fx-rates-0.0.1-SNAPSHOT.jar”]