import { IsNotEmpty } from 'class-validator';
import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, OneToMany } from 'typeorm';
import { Soldier } from '@interfaces/soldiers.interface';
import { ForceEntity } from './forces.entity';
import { UserEntity } from './users.entity';
import { ResultEntity } from './results.entity';

@Entity({ name: 'soldiers_table' })
export class SoldierEntity implements Soldier {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @IsNotEmpty()
  first_name: string;

  @Column()
  @IsNotEmpty()
  last_name: string;

  @Column()
  @IsNotEmpty()
  date_of_birth: string;

  @Column()
  @ManyToOne(() => ForceEntity, force => force.soldiers)
  @JoinColumn({ name: 'force_id', referencedColumnName: 'id' })
  force_id: number;

  @Column()
  @ManyToOne(() => UserEntity, user => user.soldiers)
  @JoinColumn({ name: 'user_id', referencedColumnName: 'id' })
  user_id: number;

  @Column()
  @IsNotEmpty()
  weight: number;

  @Column()
  @IsNotEmpty()
  height: number;

  @OneToMany(() => ResultEntity, result => result.soldier_id)
  results: ResultEntity[];
}
