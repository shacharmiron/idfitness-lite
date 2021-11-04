import { Router } from 'express';
import ForcesController from '@controllers/forces.controller';
import { Routes } from '@interfaces/routes.interface';

class ForcesRoute implements Routes {
  public path = '/forces';
  public router = Router();
  public forcesController = new ForcesController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.forcesController.getForces);
    this.router.get(`${this.path}/:id(\\d+)`, this.forcesController.getForceById);
  }
}

export default ForcesRoute;
