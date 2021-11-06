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

Configurando as migrations do typeorm
    1. Criar o script em package.json chamado "typeorm"
    2. No ormconfig configurar onde colocar as migrations => "migrationsDir" dentro de cli => "cli": {"migrationsDir": "./src/database/migrations"}
    3. No ormconfig configurar o caminho onde estão nossas migrations que serão executadas =>   "migrations": ["./src/database/migrations/*.ts"]