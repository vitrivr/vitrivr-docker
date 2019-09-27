# Dockerfile for cottontaildb only

FROM zenika/kotlin:1.3-jdk11

WORKDIR /cottontaildb

RUN apt-get update
RUN apt-get install -y git

RUN git clone https://github.com/ppanopticon/cottontaildb.git .

RUN git submodule update --init --recursive

RUN ./gradlew clean generateProto 

COPY . /cottontaildb

EXPOSE 1865

ENTRYPOINT ./gradlew run --args='config.json'
