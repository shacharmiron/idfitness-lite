import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Event } from '@/interfaces/events.interface';
import { IsNotEmpty } from 'class-validator';
import { EventTypeEntity } from './event_types.entity';
import { ForceEntity } from './forces.entity';
import { UserEntity } from './users.entity';

@Entity({ name: 'events_table' })
export class EventEntity implements Event {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => EventTypeEntity, event_type => event_type.id)
  event_type_id: number;

  @ManyToOne(() => ForceEntity, force => force.id)
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

  @ManyToOne(() => UserEntity, created_by => created_by.id)
  created_by: number;
}
