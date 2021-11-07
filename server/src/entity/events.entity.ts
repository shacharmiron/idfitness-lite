import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Event } from '@/interfaces/events.interface';
import { IsNotEmpty } from 'class-validator';
import { EventTypeEntity } from './event_types.entity';
import { ForceEntity } from './forces.entity';
import { UserEntity } from './users.entity';
import { ResultEntity } from './results.entity';

@Entity({ name: 'events_table' })
export class EventEntity implements Event {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @ManyToOne(() => EventTypeEntity, event_type => event_type.id)
  @JoinColumn({ name: 'event_type_id', referencedColumnName: 'id' })
  event_type_id: number;

  @Column()
  @ManyToOne(() => ForceEntity, force => force.id)
  @JoinColumn({ name: 'force_id', referencedColumnName: 'id' })
  force_id: number;

  @Column()
  @IsNotEmpty()
  insertion_date: Date;

  @Column()
  @IsNotEmpty()
  event_date: Date;

  @Column()
  @IsNotEmpty()
  comment: string;

  @Column()
  @IsNotEmpty()
  is_deleted: boolean;

  @Column()
  @ManyToOne(() => UserEntity, created_by => created_by.id)
  @JoinColumn({ name: 'created_by', referencedColumnName: 'id' })
  created_by: number;

  @OneToMany(() => ResultEntity, result => result.event_id)
  results: ResultEntity[];
}
