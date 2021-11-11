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
      console.log(`event_id: ${req.params.event_id}`);
      const eventId = Number(req.params.event_id);
      const findResultsData: Result[] = await this.resultService.findResultsByEvent(eventId);
      console.log(`results length: (${findResultsData.length})`);
      console.log(`results: (${findResultsData})`);

      res.status(200).json({ data: findResultsData, message: 'findByEvent' });
    } catch (error) {
      next(error);
    }
  };
}

export default ResultsController;
