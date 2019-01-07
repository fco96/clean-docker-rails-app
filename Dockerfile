FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y nodejs

# Se establece el directiorio de la app
ENV APP_HOME /app_directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Cambia el destino de instalación de rails
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
# Bundle installs with binstubs to our custom /bundle/bin volume path.

# Se mueve todo lo de la carpeta src al directiorio home de la app
ADD ./src $APP_HOME
