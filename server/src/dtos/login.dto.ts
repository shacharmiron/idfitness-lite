import { IsString } from 'class-validator';

export class CreateLoginDto {
  @IsString()
  public username: string;

  @IsString()
  public password: string;
}
