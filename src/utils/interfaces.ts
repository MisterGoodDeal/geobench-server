export interface WebService {
  app: any;
  usingHttps: boolean;
  httpsDomain?: string;
}

export interface MySQLResponse {
  fieldCount: number;
  affectedRows: number;
  insertId: number;
  info: string;
  serverStatus: number;
  warningStatus: number;
}
