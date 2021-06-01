//Pinchos que caen del cielo
class Pinchos{
  int pos1x,pos1y,pos2x,pos2y,pos3x,pos3y, cai, rev1, rev2, rev3;
  Pinchos (int p1x,int p1y, int p2x, int p2y, int p3x, int p3y, int ca, int r1, int r2, int r3){
    pos1x=p1x;
    pos1y=p1y;
    pos2x=p2x;
    pos2y=p2y;
    pos3x=p3x;
    pos3y=p3y;
    cai=ca;
    rev1=r1;
    rev2=r2;
    rev3=r3;

  }
  
  void s1(){
    fill(255,0,0);
    strokeWeight(3);
    triangle(pos1x,pos1y, pos2x, pos2y, pos3x, pos3y);
    pos1y=pos1y+cai;
    pos2y=pos2y +cai;
    pos3y=pos3y+cai;
    if (pos3y>800){
      pos1y=rev1;
      pos2y=rev2;
      pos3y=rev3;
    
  }
}
}
