#!/bin/bash
set -e

load_secret_variables() {
  local prefix="/run/secrets/${1}_"

  for i in /run/secrets/*; do
    if [[ "$i" =~ ${prefix}.* ]]
    then
      var=${i#${prefix}};
      echo "Defining secret $var";
      export ${var}=$(< $i);
    fi
  done
}

load_secret_variables $app_name

JAVA_OPTS=${JAVA_OPTS:-"-XX:MinRAMPercentage=50.0 -XX:MaxRAMPercentage=80.0"}

exec java $JAVA_OPTS \
    -Dfile.encoding=UTF-8 \
    -Dspring.main.banner-mode=OFF \
    -XshowSettings:vm \
    -jar /opt/app/app.jar
