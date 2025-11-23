FROM jupyter/pyspark-notebook:spark-3.3.0

USER root

RUN apt-get update && \
    apt-get remove -y --purge openjdk-11-* && \
    apt-get autoremove -y && \
    apt-get clean

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean

RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

RUN java -version

USER jovyan

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

