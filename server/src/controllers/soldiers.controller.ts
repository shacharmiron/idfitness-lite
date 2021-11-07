import { Soldier } from '@/interfaces/soldiers.interface';
import SoldierService from '@/services/soldiers.service';
import { NextFunction, Request, Response } from 'express';

class SoldiersController {
  public soldierService = new SoldierService();

  public getSoldiers = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const findAllSoldiersData: Soldier[] = await this.soldierService.findAllSoldiers();

      res.status(200).json({ data: findAllSoldiersData, message: 'findAll' });
    } catch (error) {
      next(error);
    }
  };
}

export default SoldiersController;
