Instalações para usar TYPEORM  
    1. yarn add typeorm reflect-metadata
    2. yarn add pg

Configurando Projeto para usar o TYPEORM
    1. Ir no tsconfig.json
        Colocar "experimentalDecorators": true,
        Colocar "emitDecoratorMetadata": true

    2. Criar conexão
        Criar pasta dentro de src chamada database.
        Dentro de database criar index.ts
        Importar a conexão para dentro do arquivo server.ts

    3. Criar configuração de conexão com banco de dados. 
        Criar na raiz do projeto um arquivo chamado "ormconfig.json"