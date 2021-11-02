import { Role } from '@/interfaces/roles.interface';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { UserEntity } from './users.entity';

@Entity({ name: 'roles_lut' })
export class RoleEntity implements Role {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  role_name: string;

  @OneToMany(() => UserEntity, user => user.role_id)
  users: UserEntity[];
}
