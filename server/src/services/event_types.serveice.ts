import { EventTypeEntity } from '@/entity/event_types.entity';
import { HttpException } from '@/exceptions/HttpException';
import { EventType } from '@/interfaces/event_types.interface';
import { isEmpty } from '@/utils/util';
import { getRepository } from 'typeorm';

class EventTypeService {
  public eventTypes = EventTypeEntity;

  public async findAllEventTypes(): Promise<EventType[]> {
    const eventTypeRepository = getRepository(this.eventTypes);
    const eventTypes: EventType[] = await eventTypeRepository.find();

    return eventTypes;
  }

  public async findEventTypeById(eventTypeId: number): Promise<EventType> {
    if (isEmpty(eventTypeId)) throw new HttpException(400, "You're not eventTypeId");

    const eventTypeRepository = getRepository(this.eventTypes);
    const findEventType: EventType = await eventTypeRepository.findOne({ where: { id: eventTypeId } });
    if (!findEventType) throw new HttpException(409, "You're not eventType");

    return findEventType;
  }
}

export default EventTypeService;
