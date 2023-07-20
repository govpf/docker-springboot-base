FROM govpf/openjdk:17-jre-alpine

ARG app_name=MY_APP
ENV app_name=$app_name
ENV WORKSPACE /opt/app

WORKDIR /opt/app

COPY docker-entrypoint.sh .

RUN addgroup app \
        && adduser -SHG app app \
        && chown -R app:app ./ \
        && chmod -R 550 ./

USER app

EXPOSE 8080

ENTRYPOINT ["/opt/app/docker-entrypoint.sh"]
