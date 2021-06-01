//Características del jugador(movimiento derecha, izquierda, salto, color forma
// los void t son las interacciones con otros objetos.
class Jugador{
 int jugx, dir;
 float jugy, mov;
 boolean s;
 Jugador(int jx,float jy, float m, int d){
   jugx=jx;
   jugy=jy;
   mov=m;
   dir=d;
   s=false;
 }
 
 void jugador1(float sal){
   sal=location.y;
    stroke(0);
   strokeWeight(2);
   fill(#FF0900);
   ellipse (jugx, jugy-mov+sal, 50, 50);
     ellipse (jugx+25, jugy+75-mov+sal, 25, 25);
     noFill();
     noStroke();
   rect (jugx-20, jugy+30-mov+sal, 40,50);
   image(cuerpo1,jugx-20, jugy+30-mov+sal);
   fill(#FF0900);
   stroke(1);
   ellipse (jugx-25, jugy+75-mov+sal, 25, 25);
   rect (jugx, jugy+100+sal, 40, 20);
   rect (jugx-20, jugy+100+sal, 40, 20);
   
   image(cara1,jugx-35, jugy-mov+sal-45);
   
   //   if (mousePressed==true){
   //     if (mouseX>180 && mouseX<580 && mouseY>150 && mouseY<600 ){
   //image(cara1,jugx-35, jugy-mov+sal-45);
   //     }
   //     if (mouseX>620 && mouseX<1020 && mouseY>150 && mouseY<600){
   //image(cara2,jugx-35, jugy-mov+sal-45);
   //     }
   //   }
   
   if(jugx>1550 && jugy+sal+120< 310 && ESTADO==JUEGO){
     jugy=180;
   }
      
   if (jugx>1950 && jugy>=180 && ESTADO==JUEGO){
    ESTADO=NIVEL2; 
    jugx=0;
    jugy=500;
   }
      if (jugx>1950&&ESTADO==NIVEL2){
    ESTADO=FINAL; 
   }
 }
 /////////////////////////////////////////////////////////////////////////
 void jugador2(float sal){
   sal=location.y;
   stroke(0);
   strokeWeight(2);
   fill(#00A8FF);
   ellipse (jugx, jugy-mov+sal, 50, 50);
     ellipse (jugx+25, jugy+75-mov+sal, 25, 25);
   rect (jugx-20, jugy+30-mov+sal, 40,50);
   image(cuerpo2,jugx-20, jugy+30-mov+sal);
   ellipse (jugx-25, jugy+75-mov+sal, 25, 25);
   rect (jugx, jugy+100+sal, 40, 20);
   rect (jugx-20, jugy+100+sal, 40, 20);
   
   image(cara2,jugx-35, jugy-mov+sal-45);
   
   //   if (mousePressed==true){
   //     if (mouseX>180 && mouseX<580 && mouseY>150 && mouseY<600 && ESTADO==JUEGO){
   //image(cara1,jugx-35, jugy-mov+sal-45);
   //     }
   //     if (mouseX>620 && mouseX<1020 && mouseY>150 && mouseY<600 && ESTADO==JUEGO){
   //image(cara2,jugx-35, jugy-mov+sal-45);
   //     }
   //   }
   
   if(jugx>1550 && jugy+sal+120< 310 && ESTADO==JUEGOb){
     jugy=180;
   }
      
   if (jugx>1950 && jugy>=180 && ESTADO==JUEGOb){
    ESTADO=NIVEL2b; 
    jugx=0;
    jugy=500;
   }
      if (jugx>1950&&ESTADO==NIVEL2b){
    ESTADO=FINAL; 
   }
 }
 /////////////////////////////////////////////////////////////
 // Esto es para que el personaje no se vea estático si no se mueve
  void balanceo(){
    mov=mov+0.2*dir;
    if (mov>5){
      dir=-dir;
    } if (mov<1){
      dir=1;
    }
  }
///////////////////////////////////////////////////////////////////    
     void movimiento(){
       if(keyPressed==true){
     if(key=='d'){
     jugx=jugx+4;
 }
 if(key=='a'){
   jugx=jugx-4;
} 
 }
 // Caida de plataforma vertical
 if(jugy+120<618.5 && (dist(jugx, jugy+location.y+120, vertical.px, vertical.py)>30) && jugx<1550){
   jugy=jugy+gravity.y+5;
 }
     }
//////////////////////////////////////////////////////////////////////////////// 
/////Habilidad de salto/////
     void salto(){
        if(s==true){ 
          // Código tomado de Jhon McCaffery (Theartboy)
   // Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  // Bounce off edges
  
  //if ((location.x > width) || (location.x < 0)) {
  //  velocity.x = velocity.x * -1;
  //}
  if (location.y > 0) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y; 
    location.y = 0;
  }
  
   }
          if(keyPressed==true){
      if(key==' '&& location.y>=0){
          s=true;
           velocity = new PVector(-3,-6);
        }
   }
  
     }
  ///////////////////////////////////////////////////////////////////////////   
    void t1(){
    float alt=dist(jugx, jugy+location.y+120, vertical.px, vertical.py);
    float alt2=dist(jugx, jugy+location.y, horizontal.px, horizontal.py);
    
    if(alt<=30 && jugx>1450 && jugx<1550){
     jugy=jugy+vertical.vel*vertical.dir; 
     
     println(vertical.py);     
    }
    if(alt2<=30){
     //jugy=jugy+horizontal.py; 
     jugx=jugx+horizontal.vel*horizontal.dir;
    
    }
    }
    
////////////////////////////////////////////////////////////////////////////    
    void t2(){
     if (dist(jugx,jugy, torti.ex1,torti.ey1)<40){
       jugx=0;
     }
    }
 /////////////////////////////////////////////////////////    
     //    void t3(){
     //      for (int i = 0; i < obs1.size(); i++){ 
     //  if (dist(jugx,jugy,obs1.get(i), obs1.get(i))<35 && ESTADO==JUEGO){
     //    jugx=0;
     //  }
     //}
     //    }  
/////////////////////////////////////////////////////////////////////         
     
     void t4(){
     if(jugy+120+location.y>618 && jugx>850 && jugx<1000 && ESTADO==NIVEL2||jugy+120+location.y>618 && jugx>850 && jugx<1000 && ESTADO==NIVEL2b){
      jugy=jugy+10; 
     }
     if(jugy>825){
       jugy=500;
       jugx=0;
     }
}
//////////////////////////////////////////////////////////////////////
////Caida por el hueco en el suelo
 void t5(){
     if (dist(jugx,jugy, avel.ex1,avel.ey1)<40){
       jugx=0;
     }
    }


}
  
  
  
  
