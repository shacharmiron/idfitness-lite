import { IsString } from 'class-validator';

export class CreateUserDto {
  @IsString()
  public username: string;

  @IsString()
  public password: string;

  @IsString()
  public salt: string;

  @IsString()
  public role_id: number;
}
