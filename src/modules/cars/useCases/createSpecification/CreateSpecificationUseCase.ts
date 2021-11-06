/* eslint-disable prettier/prettier */
import { inject, injectable } from "tsyringe";

import { ISpecificationsRepository } from "../../repositories/ISpecificationRepository";

interface IRequest {
  name: string;
  description: string;
}
@injectable()
class CreateSpecificationUseCase {
  constructor(
    @inject("SpecificationRepository")
    private specificationsRepository: ISpecificationsRepository,
  ) { }

  async execute({ name, description }: IRequest): Promise<void> {
    const specificationAlrearyExists =
      await this.specificationsRepository.findByName(name);

    if (specificationAlrearyExists) {
      throw new Error("Specification already exists!");
    }

    await this.specificationsRepository.create({ name, description });
  }
}

export { CreateSpecificationUseCase };
