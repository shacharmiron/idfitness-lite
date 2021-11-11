import { NextFunction, Request, Response } from 'express';
import { Event } from '@/interfaces/events.interface';
import EventService from '@services/events.service';
import { CreateEventDto } from '@/dtos/event.dto';

class EventsController {
  public eventsService = new EventService();

  public getEvents = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const findAllEventsData: Event[] = await this.eventsService.findAllEvents();

      res.status(200).json({ data: findAllEventsData, message: 'findAll' });
    } catch (error) {
      next(error);
    }
  };

  public createEvent = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const eventData: CreateEventDto = req.body;
      const createEventData: Event = await this.eventsService.createEvent(eventData);

      res.status(201).json({ data: createEventData, message: 'created' });
    } catch (error) {
      next(error);
    }
  };

  public getEventById = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const eventId = Number(req.params.id);
      const findOneEventData: Event = await this.eventsService.findEventById(eventId);

      res.status(200).json({ data: findOneEventData, message: 'findOne' });
    } catch (error) {
      next(error);
    }
  };
}

export default EventsController;
