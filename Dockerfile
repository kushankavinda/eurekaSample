FROM davidcaste/alpine-java-unlimited-jce

ENV SERVER_PORT 8761


## Setup work directory
RUN mkdir /server
WORKDIR /server

## Copy application
ADD ./target/eureka-0.0.1-SNAPSHOT.jar /server/

EXPOSE ${SERVER_PORT}

# Define default command.
CMD ["java","-XX:+PrintFlagsFinal","-XX:+PrintGCDetails", "-Xmx300m", "-Dspring.profiles.active=stage", "-jar", "eureka-0.0.1-SNAPSHOT.jar"]
