import { Result } from '@/interfaces/results.interface';
import { IsNotEmpty } from 'class-validator';
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { EventEntity } from './events.entity';
import { SoldierEntity } from './soldiers.entity';

@Entity({ name: 'results_table' })
export class ResultEntity implements Result {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @IsNotEmpty()
  insertion_date: Date;

  @Column()
  @IsNotEmpty()
  result: number;

  @Column()
  @ManyToOne(() => EventEntity, event => event.results)
  @JoinColumn({ name: 'event_id', referencedColumnName: 'id' })
  event_id: number;

  @Column()
  @ManyToOne(() => SoldierEntity, soldier => soldier.results)
  @JoinColumn({ name: 'soldier_id', referencedColumnName: 'id' })
  soldier_id: number;
}
