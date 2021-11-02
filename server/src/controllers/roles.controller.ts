import { Role } from '@/interfaces/roles.interface';
import RoleService from '@/services/roles.service';
import { NextFunction, Request, Response } from 'express';

class RolesController {
  public roleService = new RoleService();

  public getRoles = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const findAllUsersData: Role[] = await this.roleService.findAllRoles();

      res.status(200).json({ data: findAllUsersData, message: 'findAll' });
    } catch (error) {
      next(error);
    }
  };

  public getRoleByName = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const roleName = String(req.params.roleName);
      const findOneRoleData: Role = await this.roleService.findRoleByName(roleName);

      res.status(200).json({ data: findOneRoleData, message: 'findOne' });
    } catch (error) {
      next(error);
    }
  };
}

export default RolesController;
