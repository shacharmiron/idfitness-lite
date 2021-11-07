import { SoldierEntity } from '@/entity/soldiers.entity';
import { Soldier } from '@/interfaces/soldiers.interface';
import { getRepository } from 'typeorm';

class SoldierService {
  public soldiers = SoldierEntity;

  public async findAllSoldiers(): Promise<Soldier[]> {
    const soldierRepository = getRepository(this.soldiers);
    const soldiers: Soldier[] = await soldierRepository.find();

    return soldiers;
  }
}

export default SoldierService;
