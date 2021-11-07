import { Router } from 'express';
import SoldiersController from '@controllers/soldiers.controller';
import { Routes } from '@interfaces/routes.interface';

class SoldiersRoute implements Routes {
  public path = '/soldiers';
  public router = Router();
  public soldiersController = new SoldiersController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.soldiersController.getSoldiers);
  }
}

export default SoldiersRoute;
