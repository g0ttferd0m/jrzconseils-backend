FROM strapi/base
WORKDIR /opt/app
COPY ./app/package.json ./
COPY ./app/yarn.lock ./
RUN yarn install
COPY ./app .
ENV NODE_ENV production
ENV DATABASE_CLIENT=mysql
ENV DATABASE_NAME=strapi
ENV DATABASE_HOST=strapi-db
ENV DATABASE_PORT=3306
ENV DATABASE_USERNAME=strapi
ENV DATABASE_PASSWORD=strapi
RUN yarn build
EXPOSE 1337
CMD ["yarn", "start"]