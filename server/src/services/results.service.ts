import { ResultEntity } from '@/entity/results.entity';
import { Result } from '@/interfaces/results.interface';
import { getRepository } from 'typeorm';

class ResultService {
  public results = ResultEntity;

  public async findAllResults(): Promise<Result[]> {
    const resultRepository = getRepository(this.results);
    const results: Result[] = await resultRepository.find();

    return results;
  }
}

export default ResultService;
