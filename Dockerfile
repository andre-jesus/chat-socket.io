FROM node:16.13 AS build
WORKDIR /srv
ADD package.json .
RUN npm install
ADD . .

FROM node:16.13
COPY --from=build /srv .
EXPOSE 3000
CMD ["node", "index.js"]