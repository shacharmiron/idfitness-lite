import { IsString } from 'class-validator';

export class CreateEventDto {
  @IsString()
  public event_type_id: number;

  @IsString()
  public force_id: number;

  @IsString()
  public eventDate: Date;

  @IsString()
  public comment: string;

  @IsString()
  public is_deleted: boolean;

  @IsString()
  public created_by: number;
}
