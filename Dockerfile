FROM amazoncorretto:8u302-alpine
USER root
WORKDIR /app
COPY ./lib/* ./lib/
COPY ./app-*.jar ./app.jar
COPY ./libthreadId.so ./libthreadId.so
COPY ./config/app-config.yml ./conf/app-config.yml
COPY ./symbols.csv ./symbols.csv
RUN apk --no-cache --update add libgcc libstdc++
EXPOSE 4801 7778 8085
ENTRYPOINT nice --10 java -Djava.library.path=. -cp ./lib/*:app.jar com.ust.ticker.app.TickerApp conf/app-config.yml $APP_ZONE