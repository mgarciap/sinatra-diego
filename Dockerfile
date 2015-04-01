FROM ruby:2.1-onbuild


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
RUN bundle install --without test development

ENV VCAP_APPLICATION {}
ENV BAD_QUOTE '
ENV BAD_SHELL $1
ENV PORT 8080
EXPOSE 8080
#CMD ["rackup", "-p", $PORT]
CMD ["./start.sh"]
