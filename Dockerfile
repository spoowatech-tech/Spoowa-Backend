FROM node:20

WORKDIR /app

COPY package.json .npmrc ./

RUN npm install -g pnpm
RUN pnpm install

COPY . .

EXPOSE 9000

RUN chmod +x start.sh

CMD ["./start.sh"]
