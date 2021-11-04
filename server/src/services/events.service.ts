import { EventEntity } from '@/entity/events.entity';
import { HttpException } from '@/exceptions/HttpException';
import { Event } from '@/interfaces/events.interface';
import { isEmpty } from '@/utils/util';
import { getRepository } from 'typeorm';
import { CreateEventDto } from '@/dtos/event.dto';

class EventService {
  public events = EventEntity;

  public async findAllEvents(): Promise<Event[]> {
    const eventRepository = getRepository(this.events);
    const events: Event[] = await eventRepository.find({ order: { event_date: 'ASC' } });

    return events;
  }

  public async createEvent(userData: CreateEventDto): Promise<Event> {
    if (isEmpty(userData)) throw new HttpException(400, "You're not eventData");

    const userRepository = getRepository(this.events);
    const createEventData: Event = await userRepository.save({ ...userData });

    return createEventData;
  }
}

export default EventService;
