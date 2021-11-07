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
}

export default ResultsController;
