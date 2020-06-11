# FROM jekyll/builder
#
# WORKDIR /tmp
# ADD Gemfile /tmp/
# #ADD Gemfile.lock /tmp/
# RUN bundle update
# RUN gem install jekyll
# RUN bundle install

FROM jekyll/jekyll
ADD Gemfile .
RUN bundle update
RUN bundle install

VOLUME /src
EXPOSE 4000

WORKDIR /src
CMD ["jekyll", "serve", "--drafts", "--verbose", "-H", "0.0.0.0"]
