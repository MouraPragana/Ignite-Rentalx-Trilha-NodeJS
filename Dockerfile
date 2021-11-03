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

# Aula de comandos de docker
# docker ps => para ver todos os containers que estão de pé.
# docker ps -a => visutaliza todos os containers.
# docker rm "id" => id do container a ser removido. Precisa estar com container pausado.
# docker start "id" => id do container a ser startado.
# docker stop "id" => id do container para pausar.
# docker exec -it "id" /bin/bash => Acessar o container.
# docker logs "nome da aplicação" -f => Ficar observando o log do docker.