import EventTypeService from '@/services/event_types.serveice';
import { NextFunction, Request, Response } from 'express';
import { EventType } from '@/interfaces/event_types.interface';

class EventTypesController {
  public eventTypesService = new EventTypeService();

  public getEventTypes = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const findAllEventTypesData: EventType[] = await this.eventTypesService.findAllEventTypes();

      res.status(200).json({ data: findAllEventTypesData, message: 'findAll' });
    } catch (error) {
      next(error);
    }
  };
}

export default EventTypesController;
