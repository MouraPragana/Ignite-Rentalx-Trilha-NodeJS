1) Migrations:
    Podemos dizer que a migration é a "unidade" mais básica do projeto => Geralmente fica em ./src/database/migrations.

    Nela criamos as tabelas no banco de dados trabalhados. 

    import { MigrationInterface, QueryRunner, Table } from "typeorm";

    ## Exemplo => Criacão de Migration
    ------------------------------------------------------------------------------------
    export class CreateCategories1636161525006 implements MigrationInterface {
      public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.createTable(
          new Table({
            name: "categories",
            columns: [
              {
                name: "id",
                type: "uuid",
                isPrimary: true,
              },
              {
                name: "name",
                type: "varchar",
              },
              {
                name: "description",
                type: "varchar",
              },
              {
                name: "created_at",
                type: "timestamp",
                default: "now()",
              },
            ],
          }),
        );
      }

      public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.dropTable("categories");
      }
    }

2) Entities:
    A entity é a unidade que representa a tabela do banco de dados em nossa aplicação. 
    Temos que fazer a amarração com a migration através de @Entity("nome da tabela criada no migration")

    ## Exemplo => Criação de Entity
    ------------------------------------------------------------------------------------
    import { Column, CreateDateColumn, Entity, PrimaryColumn } from "typeorm";
    import { v4 as uuidV4 } from "uuid";

    @Entity("categories") // Nome da tabela configurada na migration.
    class Category {
      @PrimaryColumn()
      id?: string;

      @Column()
      name: string;

      @Column()
      description: string;

      @CreateDateColumn()
      created_at: Date;

      constructor() {
        if (!this.id) {
          this.id = uuidV4();
        }
      }
    }

    export { Category };

3) Repositories: 
    Em repositories tempos dois pilares:
      a) A parte de implementação => implementations. Aqui é feita a implementação através de "class CategoriesRepository **implements** ICategoriesRepository{}"

      ## Exemplo => Criação do implementation
      ----------------------------------------------------------------------------------
      import { getRepository, Repository } from "typeorm";

      import { Category } from "../../entities/Category";
      import {
        ICategoriesRepository,
        ICreateCategoryDTO,
      } from "../ICategoriesRepository";

      class CategoriesRepository implements ICategoriesRepository {
        // O private está dizendo que o repository
        // só pode ser acessado dentro dessa classe.
        private repository: Repository<Category>;

        constructor() {
          this.repository = getRepository(Category);
        }

        async create({ name, description }: ICreateCategoryDTO): Promise<void> {
          const category = this.repository.create({
            description,
            name,
          });

          await this.repository.save(category);
        }

        async list(): Promise<Category[]> {
          const categories = await this.repository.find();
          return categories;
        }

        async findByName(name: string): Promise<Category> {
          const category = this.repository.findOne({ name });
          return category;
        }
      }

      export { CategoriesRepository };

      b) A parte mais abstrata, que possui todos os métodos fazendo amarração com a entidade. Métodos de exemplo: findByName, list e create.

      ## Exemplo => Criação abstrata do implementation
      ----------------------------------------------------------------------------------
      import { Category } from "../entities/Category";

      interface ICreateCategoryDTO {
        name: string;
        description: string;
      }

      interface ICategoriesRepository {
        findByName(name: string): Promise<Category>;
        list(): Promise<Category[]>;
        create({ name, description }: ICreateCategoryDTO): Promise<void>;
      }

      export { ICategoriesRepository, ICreateCategoryDTO };

