export interface AddCommentBody {
  username: string;
  banc: number;
  commentaire: string;
}

export interface AddBenchBody {
  longitude: number;
  latitude: number;
  note: number;
  lieu: string;
  environnement: string;
  user: string;
  commetaire: string;
  nom_photo: string;
}
