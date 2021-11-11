import { Result } from '@/interfaces/results.interface';
import ResultService from '@/services/results.service';
import { NextFunction, Request, Response } from 'express';

class ResultsController {
  public resultService = new ResultService();

  public getResults = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const findAllResultsData: Result[] = await this.resultService.findAllResults();

      res.status(200).json({ data: findAllResultsData, message: 'findAll' });
    } catch (error) {
      next(error);
    }
  };

  public getResultsByEvent = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const eventId = Number(req.params.event_id);
      const findResultsData: Result[] = await this.resultService.findResultsByEvent(eventId);

      res.status(200).json({ data: findResultsData, message: 'findByEvent' });
    } catch (error) {
      next(error);
    }
  };

  public getResultsBySoldier = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
      const soldierId = Number(req.params.soldier_id);
      const findResultsData: Result[] = await this.resultService.findResultsBySoldier(soldierId);

      res.status(200).json({ data: findResultsData, message: 'findBySoldier' });
    } catch (error) {
      next(error);
    }
  };
}

export default ResultsController;
