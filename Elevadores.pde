// Plataformas en movimiento
class Elevadores{
 
  int px,py,vel, dir, tamx,tamy;
  boolean altura;
 Elevadores(int x1,int y1, int v1, int d1, int t1, int t2){
    px=x1;
    py=y1;
    vel=v1;
    dir=d1;
    tamx=t1;
    tamy=t2;
    altura=false;
    
  }
  
  void roca1(){
    rectMode(CENTER);
    fill(#DBD4D4);
     strokeWeight(3); 
    rect (px,py, tamx,tamy);
    px=px+vel*dir;
    if(px>1800){
      dir=-dir;
    }if(px<1550){
      dir=1;
    }
    rectMode(CORNER);
}

void roca2(){
  rectMode(CENTER);
  fill(#DBD4D4);
     strokeWeight(3);
    rect (px,py, tamx,tamy);
    py=py+vel*dir;
    if(py>642.5){
      dir=-dir;
    }if(py<150){
      dir=1;
    }
    rectMode(CORNER);
}
}
