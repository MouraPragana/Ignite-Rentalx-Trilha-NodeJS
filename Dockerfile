FROM node


WORKDIR /usr/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3333

CMD ["npm","run","dev"]

# docker build -t rentx .
# docker run -p 3333:3333 rentx
# docker ps
# docker exec -it "nome do container" /bin/bash
# depois do passo acima basta digitar ls que verá todas as pastas exportadas - menos as que estã0 no .dockerignore