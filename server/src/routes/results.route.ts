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
  }
}

export default ResultsRoute;
