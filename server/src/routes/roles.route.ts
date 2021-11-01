import RolesController from '@/controllers/roles.controller';
import { Routes } from '@/interfaces/routes.interface';
import { Router } from 'express';

class RolesRoute implements Routes {
  public path = '/roles';
  public router = Router();
  public rolesController = new RolesController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.rolesController.getRoles);
    this.router.get(`${this.path}/:roleName`, this.rolesController.getRoleByName);
  }
}

export default RolesRoute;
