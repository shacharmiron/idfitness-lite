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

  public async createEvent(eventData: CreateEventDto): Promise<Event> {
    if (isEmpty(eventData)) throw new HttpException(400, "You're not eventData");

    const eventRepository = getRepository(this.events);
    const createEventData: Event = await eventRepository.save({ ...eventData });

    return createEventData;
  }

  public async findEventById(eventId: number): Promise<Event> {
    if (isEmpty(eventId)) throw new HttpException(400, "You're not eventId");

    const eventRepository = getRepository(this.events);
    const findEvent: Event = await eventRepository.findOne({ where: { id: eventId } });
    if (!findEvent) throw new HttpException(409, "You're not event");

    return findEvent;
  }
}

export default EventService;
