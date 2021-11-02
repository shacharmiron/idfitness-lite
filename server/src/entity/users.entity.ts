import { IsNotEmpty } from 'class-validator';
import { Entity, PrimaryGeneratedColumn, Column, JoinColumn, ManyToOne } from 'typeorm';
import { User } from '@interfaces/users.interface';
import { RoleEntity } from './roles.entity';

@Entity({ name: 'users_table' })
export class UserEntity implements User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @IsNotEmpty()
  username: string;

  @Column()
  @IsNotEmpty()
  password: string;

  @Column()
  @IsNotEmpty()
  salt: string;

  @Column()
  @ManyToOne(() => RoleEntity, role => role.users)
  @JoinColumn({ name: 'role_id', referencedColumnName: 'id' })
  role_id: number;
}
