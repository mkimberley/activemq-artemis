FROM registry.access.redhat.com/ubi9/ubi:9.2-755 AS builder

RUN dnf -y update && \
    dnf -y install maven npm java-17-openjdk

COPY . .

RUN  export MAVEN_OPTS="-Xms2048M -Xmx2048M" && \
     mvn -T 4 -Prelease -DskipTests package
