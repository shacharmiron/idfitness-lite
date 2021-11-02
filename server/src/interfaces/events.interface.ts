export interface Event {
  id: number;
  event_type_id: number;
  force_id: number;
  insertion_date: Date;
  event_date: Date;
  comment: string;
  is_deleted: boolean;
  created_by: number;
}
