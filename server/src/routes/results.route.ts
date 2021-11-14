import { Router } from 'express';
import ResultsController from '@controllers/results.controller';
import { Routes } from '@interfaces/routes.interface';

class ResultsRoute implements Routes {
  public path = '/results';
  public router = Router();
  public resultsController = new ResultsController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.resultsController.getResults);
    this.router.get(`${this.path}/event/:event_id(\\d+)`, this.resultsController.getResultsByEvent);
    this.router.get(`${this.path}/soldier/:soldier_id(\\d+)`, this.resultsController.getResultsBySoldier);
  }
}

export default ResultsRoute;
