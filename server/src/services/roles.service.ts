import { RoleEntity } from '@/entity/roles.entity';
import { HttpException } from '@/exceptions/HttpException';
import { Role } from '@/interfaces/roles.interface';
import { isEmpty } from '@/utils/util';
import { getRepository } from 'typeorm';

class RoleService {
  public roles = RoleEntity;

  public async findAllRoles(): Promise<Role[]> {
    const roleRepository = getRepository(this.roles);
    const allRoles: Role[] = await roleRepository.find();

    return allRoles;
  }

  public async findRoleByName(roleName: string): Promise<Role> {
    if (isEmpty(roleName)) throw new HttpException(400, "You're not role name");

    const roleRepository = getRepository(this.roles);
    const findRole: Role = await roleRepository.findOne({ where: { role_name: roleName } });
    if (!findRole) throw new HttpException(409, "You're not role");

    return findRole;
  }
}

export default RoleService;
