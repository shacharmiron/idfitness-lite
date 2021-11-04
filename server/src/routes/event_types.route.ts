import { Router } from 'express';
import EventTypesController from '@controllers/event_types.controller';
import { Routes } from '@interfaces/routes.interface';

class EventTypesRoute implements Routes {
  public path = '/eventTypes';
  public router = Router();
  public eventTypesController = new EventTypesController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.eventTypesController.getEventTypes);
    this.router.get(`${this.path}/:id(\\d+)`, this.eventTypesController.getEventTypeById);
  }
}

export default EventTypesRoute;
