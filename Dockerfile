FROM openjdk:8-alpine
VOLUME /tmp
COPY target/dependency/BOOT-INF/lib /app/lib
COPY target/dependency/META-INF /app/META-INF
COPY target/dependency/BOOT-INF/classes /app
ENV SPRING_CLOUD_STREAM_BINDER_FILE_PREFIX /pipes
ENTRYPOINT ["java","-Xmx128m","-Djava.security.egd=file:/dev/./urandom","-XX:TieredStopAtLevel=1","-noverify","-cp","app:app/lib/*","io.projectriff.invoker.JavaFunctionInvokerApplication"]
