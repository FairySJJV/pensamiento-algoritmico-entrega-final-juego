//"d" para ir a la derecha, "a" para ir a la izquierda, "ESPACIO" para saltar.
// Para saltar en el aire primero se usa "ESPACIO" y luego si se oprime una de las teclas "d" o "a"
// Cuidado con los objetos rojos y ls enemigos voladores

int ESTADO;
int MENU= 1;
int SELECCION= 2;
int JUEGO= 3;
int NIVEL2= 4;
int FINAL= 5;
int JUEGOb=6;
int NIVEL2b= 7;

int cl, c2, c3;
int conteoM, conteoM2;

int tiempoinicial;
int tiempoactual;
int tiempoactual2;
int tiempofinal;

boolean s=false;

Jugador mujer;
Plataformas piso, paredladrillos, paredladrillos2;
Elevadores horizontal, vertical;
Enemigos torti, avel;

PFont fuente;
PImage ilufinal;
PImage menu1;
PImage menu2;
PImage cara1;
PImage cara2;
PImage cuerpo1;
PImage cuerpo2;
PImage enemigo1;
PImage enemigo2;
PImage J1;
PImage J2;

PVector location;  
PVector velocity; 
PVector gravity; 

ArrayList<Pinchos> obs1;
ArrayList<Pinchos> obs2;

Table puntaje;

void setup (){
  size (1200, 800);
  background(0);
  
   obs1 = new ArrayList<Pinchos>();
   obs1.add(new Pinchos(150,-25, 200,-25, 175,25,3, -25,-25,25));
  obs1.add(new Pinchos(200,-50, 250,-50, 225, 0, 3, -50,-50,0));
  obs1.add(new Pinchos(250,-75, 300,-75, 275, -25, 3, -75,-75,-25));
  
   obs2 = new ArrayList<Pinchos>();
   obs2.add(new Pinchos(1200,-25, 1250,-25, 1225, 25,3, -25,-25,25));
  obs2.add(new Pinchos(1300,-50, 1350,-50, 1325, 0, 3, -50,-50,0));
  obs2.add(new Pinchos(1400,-75, 1450,-75, 1425, -25, 3, -75,-75,-25));
  obs2.add(new Pinchos(1500,-100, 1550,-100, 1525, -50, 3, -100,-100,-50));
  obs2.add(new Pinchos(1600,-125, 1650,-125, 1625, -75, 3, -125,-125,-75));
    
   location = new PVector(0,0);
  velocity = new PVector(-3,-6);
  gravity = new PVector(0,0.2);
  
  fuente=loadFont("ComicSansMS-BoldItalic-50.vlw");
  textFont(fuente);
  
  ilufinal= loadImage("Ilustracion Final Juego.png");
  menu1= loadImage("ilustracion menu 1.png");
   menu2= loadImage("ilustracion menu 2.png");
    cara1= loadImage("cara 1.png");
    cara2= loadImage("cara 2.png");
  cuerpo1= loadImage("cuerpo1.6.png");
  cuerpo2= loadImage("cuerpo2.png");
  enemigo1= loadImage("torti.png");
  enemigo2= loadImage("avel.png");
   J1= loadImage("Selección J1.png");
 J2= loadImage("Selección J2.png");
  
  mujer= new Jugador(50, 500,0, 1);
  piso= new Plataformas (0,0);
  paredladrillos= new Plataformas(0,0);
  paredladrillos2=new Plataformas(-50,50);
  horizontal= new Elevadores (1600, 210,4,1, 100,50);
  vertical= new Elevadores (1500, 150,4,1, 100,50);
  torti=new Enemigos (500,572, 2,1,1,1);
  avel=new Enemigos (300,572, 5,1,1,1);
  
  //puntaje = new Table();
  //puntaje.addColumn("Puntaje");
  //puntaje.addColumn("Tiempo");
  //puntaje.addColumn("Muertes");
  
  puntaje=loadTable("data/ListaPuntaje.csv", "header");
  
  tiempoinicial=millis();
  
  ESTADO= MENU;
}
////////////////////////////////////////////////////////////////////////////

void draw(){
  background (0);
  
  
 /////////////////////////////////////////////////////////////////////////////
 // Pantalla inicio
  if (ESTADO==MENU){
    tiempoinicial=0;  
    image(menu1,830,0);
    image(menu2,-40,0);
    
    cl=color(255,0,0);
    
    paredladrillos.muro(300,0, 800);
    paredladrillos2.muro(350,50, 800);
    
   
     fill(#FF0000);
    textSize(110);
   text ("Adventure's Desire", 100, 120); 
    
      if(mouseX>320 && mouseX<870 && mouseY>380 && mouseY<460){
      cl= color (255,255,0);
    } 
     fill(cl);
   textSize(80);
    text ("Empezar juego", 320, 420);
    
    //if (mousePressed==true){
    // if (mouseX>320 && mouseX<870 && mouseY>380 && mouseY<460 && ESTADO==MENU){
    //  ESTADO=SELECCION;
    //}
    //}
  }
  ////////////////////////////////////////////////////////////////////////////  
  // Selección personaje
  else if(ESTADO==SELECCION){
    fill(255,0,0);
    textSize(55);
    text("Seleccione al personaje", 300,70);
    
    textSize(30);
    text("Jugador 1", 180, 630);
    text("Jugador 2", 620, 630);
    
    c2=color (0);
    c3=color (0);
    fill(#2F3031);
    if (mouseX>180 && mouseX<580 && mouseY>150 && mouseY<600){
     c2 = color(255,255,0);
    }
     if (mouseX>620 && mouseX<1020 && mouseY>150 && mouseY<600){
     c3 = color(255,255,0);
    }
    stroke(c2);
    rect(180,150,400,450);
    stroke(c3);
    rect(620,150,400,450);
     
     image(J1,180,150);
     image(J2,620,150);
    
    if (mousePressed==true){
        if (mouseX>180 && mouseX<580 && mouseY>150 && mouseY<600){
      ESTADO=JUEGO;
}
if (mouseX>620 && mouseX<1020 && mouseY>150 && mouseY<600){
  ESTADO=JUEGOb;
}
    }
    
  }
///////////////////////////////////////////////////////////////////////////////////////  
// Nivel 1 Jugador 1
  else if(ESTADO==JUEGO){
tiempoactual= millis();
    
    surface.setLocation(-15,100);
    surface.setSize(1950,800);
    background(#49516F);
    
    for(int i = 0 ; i<obs1.size(); i++){
 Pinchos pi = obs1.get(i);
 pi.s1();
  if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<20 && ESTADO==JUEGO){
         mujer.jugx=0;
     }
     if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<22 && ESTADO==JUEGO){
        conteoM=conteoM+1;
   
     }
} 

torti.enemigo1(350,572,1200,500);
    
    fill(#716138);
    rect(0, 618.5, 1950, 181.5);
    
     fill(#8B8B8B);
    rect(1550,310,1950,308.5);
    fill(0,0,0);
    textSize(150);
    text("-->",1600, 200);
    
    mujer.jugador1(location.y);
    mujer.balanceo();
    mujer.movimiento();
    mujer.salto();
    mujer.t1();
    mujer.t2();
    //mujer.t3();
    
    piso.suelo();
    
    fill(0);
    textSize(20);
    text("Izquierda a",50, 700); 
    text("Derecha d" ,50, 740) ;
    text("Salto ESPACIO", 50, 780);
    
    //rect (25, 25, 125,25);
    //fill (#05BCFC);
    // rect (25, 50, 125,25);
     
    // fill(0);
    // textSize(20);
    // text("hp", 160, 50);
    // text("mp", 160, 75);
     
      textSize(35);      
    text((tiempoactual-tiempoinicial)/1000, 1800, 50);
    text(conteoM,1700,50);
    if(dist(mujer.jugx,mujer.jugy, torti.ex1,torti.ey1)<41){
      conteoM=conteoM+1;
    }
    
    //horizontal.roca1();
    vertical.roca2();
    
      TableRow newRow = puntaje.addRow();
  newRow.setInt("Puntaje", puntaje.lastRowIndex());
  newRow.setString("Puntaje", "Nivel 1");
  newRow.setInt("Tiempo", tiempoactual/1000);
  newRow.setInt("Muertes", conteoM);
  }
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
 //Nivel 2 Jugador 1
  else if(ESTADO==NIVEL2){
    tiempoactual2= millis();
    
    background(#49516F);
    
            for(int i = 0 ; i<obs2.size(); i++){
 Pinchos pi = obs2.get(i);
 pi.s1();
 if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<20 && ESTADO==NIVEL2){
         mujer.jugx=0;
       }
       
       if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<22 && ESTADO==NIVEL2){
         conteoM2=conteoM2+1;
       }
}
    
    paredladrillos.muro(-50,618, 800);
    paredladrillos2.muro(0,668,750);
    paredladrillos.muro(1000,618, 1950);
    paredladrillos2.muro(1050,668,1950);
    
    avel.enemigo2(400,572,900,300);
    
    mujer.jugador1(location.y);
    mujer.balanceo();
    mujer.movimiento();
    mujer.salto();
    mujer.t4();
    mujer.t5();  
    
    //conteoM2=conteoM2+conteoM;
    fill(0);
    text(conteoM2,1700,50);
     if(dist(mujer.jugx,mujer.jugy, avel.ex1,avel.ey1)<43 || mujer.jugy>822){
      conteoM2=conteoM2+1;
    }
    
    textSize(35);      
    text((tiempoactual2-tiempoactual)/1000, 1800, 50);
    
       TableRow newRow2 = puntaje.addRow();
  newRow2.setInt("Puntaje", puntaje.lastRowIndex());
  newRow2.setString("Puntaje", "Nivel 2");
  newRow2.setInt("Tiempo", tiempoactual2/1000);
  newRow2.setInt("Muertes", conteoM2);
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////Nivel 1 Jugador 2
   else if(ESTADO==JUEGOb){
tiempoactual= millis();
    
    surface.setLocation(-15,100);
    surface.setSize(1950,800);
    background(#49516F);
    
    for(int i = 0 ; i<obs1.size(); i++){
 Pinchos pi = obs1.get(i);
 pi.s1();
  if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<20 && ESTADO==JUEGOb){
         mujer.jugx=0;
     }
     if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<22 && ESTADO==JUEGOb){
        conteoM=conteoM+1;
   
     }
} 

torti.enemigo1(350,572,1200,500);
    
    fill(#716138);
    rect(0, 618.5, 1950, 181.5);
    
     fill(#8B8B8B);
    rect(1550,310,1950,308.5);
    fill(0,0,0);
    textSize(150);
    text("-->",1600, 200);
    
    mujer.jugador2(location.y);
    mujer.balanceo();
    mujer.movimiento();
    mujer.salto();
    mujer.t1();
    mujer.t2();
    //mujer.t3();
    
    piso.suelo();
    
    fill(0);
    textSize(20);
    text("Izquierda a",50, 700); 
    text("Derecha d" ,50, 740) ;
    text("Salto ESPACIO", 50, 780);
    
    //rect (25, 25, 125,25);
    //fill (#05BCFC);
    // rect (25, 50, 125,25);
     
    // fill(0);
    // textSize(20);
    // text("hp", 160, 50);
    // text("mp", 160, 75);
     
      textSize(35);      
    text((tiempoactual-tiempoinicial)/1000, 1800, 50);
    text(conteoM,1700,50);
    if(dist(mujer.jugx,mujer.jugy, torti.ex1,torti.ey1)<41){
      conteoM=conteoM+1;
    }
    
    //horizontal.roca1();
    vertical.roca2();
    
      TableRow newRow = puntaje.addRow();
  newRow.setInt("Puntaje", puntaje.lastRowIndex());
  newRow.setString("Puntaje", "Nivel 1");
  newRow.setInt("Tiempo", tiempoactual/1000);
  newRow.setInt("Muertes", conteoM);
  }
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
 //Nivel 2 Jugador 2
  else if(ESTADO==NIVEL2b){
    tiempoactual2= millis();
    
    background(#49516F);
    
            for(int i = 0 ; i<obs2.size(); i++){
 Pinchos pi = obs2.get(i);
 pi.s1();
 if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<20 && ESTADO==NIVEL2b){
         mujer.jugx=0;
       }
       
       if (dist(mujer.jugx,mujer.jugy,pi.pos3x, pi.pos3y)<22 && ESTADO==NIVEL2b){
         conteoM2=conteoM2+1;
       }
}
    
    paredladrillos.muro(-50,618, 800);
    paredladrillos2.muro(0,668,750);
    paredladrillos.muro(1000,618, 1950);
    paredladrillos2.muro(1050,668,1950);
    
    avel.enemigo2(400,572,900,300);
    
    mujer.jugador2(location.y);
    mujer.balanceo();
    mujer.movimiento();
    mujer.salto();
    mujer.t4();
    mujer.t5();  
    
    //conteoM2=conteoM2+conteoM;
    fill(0);
    text(conteoM2,1700,50);
     if(dist(mujer.jugx,mujer.jugy, avel.ex1,avel.ey1)<43 || mujer.jugy>820){
      conteoM2=conteoM2+1;
    }
    
    textSize(35);      
    text((tiempoactual2-tiempoactual)/1000, 1800, 50);
    
       TableRow newRow2 = puntaje.addRow();
  newRow2.setInt("Puntaje", puntaje.lastRowIndex());
  newRow2.setString("Puntaje", "Nivel 2");
  newRow2.setInt("Tiempo", tiempoactual2/1000);
  newRow2.setInt("Muertes", conteoM2);
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Créditos
  else if (ESTADO==FINAL){
    tiempofinal=millis();
    background(#2F3031);
      fill(#AFACAC);
  rect(700,0, 500, 250);
   rect(700, 250, 500, 550);
    
    String creditos=("Creado Por: Samuel Jerez Universidad de los Andes DISO2401 Pensamiento Algorítmico"); 
    fill(255);
     textSize(100);
  text("FINAL", 800, 150);
  textSize(50);
  text(creditos, 800, 300, 350, 700);
  
  image(ilufinal, 0,0);
  
        TableRow newRow3 = puntaje.addRow();
  newRow3.setInt("Puntaje", puntaje.lastRowIndex());
  newRow3.setString("Puntaje", "Total");
  newRow3.setInt("Tiempo", tiempoactual+tiempoactual2);
  newRow3.setInt("Muertes", (conteoM+conteoM2)/1000);
  
  //saveTable(puntaje, "data/ListaPuntaje.csv");
}
}

void mouseReleased(){
     if (mouseX>320 && mouseX<870 && mouseY>380 && mouseY<460 && ESTADO==MENU){
      ESTADO=SELECCION;
    }
      if (mouseX>180 && mouseX<580 && mouseY>150 && mouseY<600 || mouseX>620 && mouseX<1020 && mouseY>150 && mouseY<600){
      tiempoinicial= millis();
      }

}

//void keyPressed(){
//  if(keyCode==' '&& location.y>=0){
//          s=true;
//           velocity = new PVector(-3,-6);
//        }
        
//}

//Código de Daniel Shiffman 
  //  if(s==true){
  // // Add velocity to the location.
  //location.add(velocity);
  //// Add gravity to velocity
  //velocity.add(gravity);
  
  //// Bounce off edges
  
  ////if ((location.x > width) || (location.x < 0)) {
  ////  velocity.x = velocity.x * -1;
  ////}
  //if (location.y > 0) {
  //  // We're reducing velocity ever so slightly 
  //  // when it hits the bottom of the window
  //  velocity.y = velocity.y; 
  //  location.y = 0;
  //}
  // }
