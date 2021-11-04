import { ForceEntity } from '@/entity/forces.entity';
import { HttpException } from '@/exceptions/HttpException';
import { Force } from '@/interfaces/forces.interface';
import { isEmpty } from '@/utils/util';
import { getRepository } from 'typeorm';

class ForceService {
  public forces = ForceEntity;

  public async findAllForces(): Promise<Force[]> {
    const forceRepository = getRepository(this.forces);
    const forces: Force[] = await forceRepository.find();

    return forces;
  }

  public async findForceById(forceId: number): Promise<Force> {
    if (isEmpty(forceId)) throw new HttpException(400, "You're not forceId");

    const forceRepository = getRepository(this.forces);
    const findForce: Force = await forceRepository.findOne({ where: { id: forceId } });
    if (!findForce) throw new HttpException(409, "You're not force");

    return findForce;
  }
}

export default ForceService;
