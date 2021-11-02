import { ForceEntity } from '@/entity/forces.entity';
import { Force } from '@/interfaces/forces.interface';
import { getRepository } from 'typeorm';

class ForceService {
  public forces = ForceEntity;

  public async findAllForces(): Promise<Force[]> {
    const forceRepository = getRepository(this.forces);
    const forces: Force[] = await forceRepository.find();

    return forces;
  }
}

export default ForceService;
