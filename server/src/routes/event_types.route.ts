import { Router } from 'express';
import EventTypesController from '@controllers/event_types.controller';
import { Routes } from '@interfaces/routes.interface';

class EventTypesRoute implements Routes {
  public path = '/event-types';
  public router = Router();
  public eventTypesController = new EventTypesController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.eventTypesController.getEventTypes);
  }
}

export default EventTypesRoute;
