import { Router } from 'express';
import EventsController from '@controllers/events.controller';
import { Routes } from '@interfaces/routes.interface';

class EventsRoute implements Routes {
  public path = '/events';
  public router = Router();
  public eventsController = new EventsController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.eventsController.getEvents);
    this.router.post(`${this.path}`, this.eventsController.createEvent);
  }
}

export default EventsRoute;
