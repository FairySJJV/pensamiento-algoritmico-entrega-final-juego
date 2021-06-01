// Enemigos voladores que se mueven en ciertos sector del mapa
class Enemigos{
 int ex1,ey1, velx, dirx, vely,diry;
 
 Enemigos(int x1 ,int y1, int vx, int dx, int vy, int dy){
  ex1=x1;
  ey1=y1;
  velx=vx;
  dirx=dx;
  vely=vy;
  diry=dy;
   }
 /////////////////////Aparece en el primer nivel////////////////
 void enemigo1(int yl1,int yl2, int xl1,int xl2){
   rectMode(CENTER);
   noFill();
   noStroke();
   rect(ex1,ey1, 75,75);
   image(enemigo1,ex1-55, ey1-55);
   
   ey1=ey1+vely*-diry;
   ex1=ex1+velx*dirx;
   
   if(ey1<yl1){
    diry=-diry; 
   }if(ey1>yl2){
    diry=1;
  }
  
  if(ex1>xl1){
     dirx=-dirx;
 }if(ex1<xl2){
     dirx=1;
 }
 rectMode(CORNER);
}
//////////////////////Aparece en el segundo nivel//////////////////////////////////
void enemigo2(int yl1,int yl2, int xl1,int xl2){
   rectMode(CENTER);
   noFill();
   noStroke();
   rect(ex1,ey1, 75,75);
   image(enemigo2,ex1-55, ey1-55);
   
   ey1=ey1+vely*-diry;
   ex1=ex1+velx*dirx;
   
   if(ey1<yl1){
    diry=-diry; 
   }if(ey1>yl2){
    diry=1;
  }
  
  if(ex1>xl1){
     dirx=-dirx;
 }if(ex1<xl2){
     dirx=1;
 }
 rectMode(CORNER);
}

}
