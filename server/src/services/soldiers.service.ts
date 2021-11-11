import { SoldierEntity } from '@/entity/soldiers.entity';
import { HttpException } from '@/exceptions/HttpException';
import { Soldier } from '@/interfaces/soldiers.interface';
import { isEmpty } from '@/utils/util';
import { getRepository } from 'typeorm';

class SoldierService {
  public soldiers = SoldierEntity;

  public async findAllSoldiers(): Promise<Soldier[]> {
    const soldierRepository = getRepository(this.soldiers);
    const soldiers: Soldier[] = await soldierRepository.find();

    return soldiers;
  }

  public async findSoldierById(soldierId: number): Promise<Soldier> {
    if (isEmpty(soldierId)) throw new HttpException(400, "You're not soldierId");

    const soldierRepository = getRepository(this.soldiers);
    const findSoldier: Soldier = await soldierRepository.findOne({ where: { id: soldierId } });
    if (!findSoldier) throw new HttpException(409, "You're not soldier");

    return findSoldier;
  }
}

export default SoldierService;
