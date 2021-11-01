export interface User {
  id: number;
  username: string;
  password: string;
  salt: string;
  role_id: number;
}
