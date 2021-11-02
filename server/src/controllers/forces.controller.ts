import { NextFunction, Request, Response } from 'express';
import { Force } from '@/interfaces/forces.interface';
import ForceService from '@services/forces.service';

class ForcesController {
  public forcesService = new ForceService();

  public getForces = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const findAllForcesData: Force[] = await this.forcesService.findAllForces();

      res.status(200).json({ data: findAllForcesData, message: 'findAll' });
    } catch (error) {
      next(error);
    }
  };
}

export default ForcesController;
