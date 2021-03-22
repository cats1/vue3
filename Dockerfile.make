FROM vue-cms:base
COPY ./ /vue-cms/
RUN rm -rf /vue-cms/node_modules
RUN cp -rf /vue-cms-base/node_modules /vue-cms/
WORKDIR /vue-cms/
RUN npm install
ENTRYPOINT ["sh", "building-entrypoint.sh"]