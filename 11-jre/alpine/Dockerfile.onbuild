FROM govpf/openjdk:11-jre-debian

ARG app_name=MY_APP
ENV app_name=$app_name
ENV WORKSPACE /opt/app

WORKDIR /opt/app

COPY docker-entrypoint.sh .
ONBUILD COPY --from=builder /usr/src/app/target/*.jar $WORKSPACE/app.jar

RUN addgroup app \
        && adduser --system --no-create-home --group app \
        && chown -R app:app ./ \
        && chmod -R 550 ./

USER app

EXPOSE 8080

ENTRYPOINT ["/opt/app/docker-entrypoint.sh"]
