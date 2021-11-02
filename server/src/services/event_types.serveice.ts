import { EventTypeEntity } from '@/entity/event_types.entity';
import { EventType } from '@/interfaces/event_types.interface';
import { getRepository } from 'typeorm';

class EventTypeService {
  public eventTypes = EventTypeEntity;

  public async findAllEventTypes(): Promise<EventType[]> {
    const eventTypeRepository = getRepository(this.eventTypes);
    const eventTypes: EventType[] = await eventTypeRepository.find();

    return eventTypes;
  }
}

export default EventTypeService;
