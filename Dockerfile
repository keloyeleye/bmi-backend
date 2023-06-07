# After Build, for continous workflow

FROM node:19-alpine

WORKDIR /bmi-server-skp

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3105

CMD ["node", "server.js"]
