import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { EventType } from '@/interfaces/event_types.interface';
import { IsNotEmpty } from 'class-validator';
import { EventEntity } from './events.entity';

@Entity({ name: 'event_types_lut' })
export class EventTypeEntity implements EventType {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  @IsNotEmpty()
  display_name: string;

  @OneToMany(() => EventEntity, event => event.event_type_id)
  events: EventEntity[];
}
