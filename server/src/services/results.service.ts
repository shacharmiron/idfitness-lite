import { ResultEntity } from '@/entity/results.entity';
import { HttpException } from '@/exceptions/HttpException';
import { Result } from '@/interfaces/results.interface';
import { isEmpty } from '@/utils/util';
import { getRepository } from 'typeorm';

class ResultService {
  public results = ResultEntity;

  public async findAllResults(): Promise<Result[]> {
    const resultRepository = getRepository(this.results);
    const results: Result[] = await resultRepository.find();

    return results;
  }

  public async findResultsByEvent(eventId: number): Promise<Result[]> {
    if (isEmpty(eventId)) throw new HttpException(400, "You're not eventId");

    const resultRepository = getRepository(this.results);
    const findResults: Result[] = await resultRepository.find({ where: { event_id: eventId } });
    if (!findResults) throw new HttpException(409, "You're not event");

    return findResults;
  }

  public async findResultsBySoldier(soldierId: number): Promise<Result[]> {
    if (isEmpty(soldierId)) throw new HttpException(400, "You're not soldierId");

    const resultRepository = getRepository(this.results);
    const findResults: Result[] = await resultRepository.find({ where: { soldier_id: soldierId } });
    if (!findResults) throw new HttpException(409, "You're not soldier");

    return findResults;
  }
}

export default ResultService;
