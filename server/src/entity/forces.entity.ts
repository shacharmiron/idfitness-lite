import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn, Unique } from 'typeorm';
import { Force } from '@/interfaces/forces.interface';
import { IsNotEmpty } from 'class-validator';

@Entity({ name: 'forces_table' })
@Unique(['id'])
export class ForceEntity implements Force {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @IsNotEmpty()
  display_name: string;

  @Column({ nullable: true })
  @ManyToOne(() => ForceEntity, parent => parent.children)
  @JoinColumn({ name: 'parent_id', referencedColumnName: 'id' })
  parent_id: number;

  @OneToMany(() => ForceEntity, child => child.parent_id)
  children: ForceEntity[];
}
