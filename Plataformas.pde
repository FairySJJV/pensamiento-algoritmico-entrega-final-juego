// Objetos estáticos que componen el mapa(pisos, muros>)
class Plataformas{
  
 int trinx, triny;
 Plataformas (int trx, int tny){
   trinx=trx;
   triny=tny;
 }
 
   void suelo(){
   for(trinx=0; trinx<=1950; trinx=trinx+50){
     fill(#2BDE1F);
     stroke(0);
     strokeWeight(3);
   triangle(trinx,triny+618.5, trinx+50, triny+618.5, trinx+ 25, triny+658.5);
 
 }
}

 void muro(int avx, int avy, int anch){
   for(trinx=avx;trinx<=anch;trinx=trinx+100){
    for(int triny=avy ; triny<=800; triny=triny+100){
      fill(#7C7575);
      stroke(0);
      strokeWeight(4);
      rect(trinx, triny, 100, 50);
    }
  }
 }
}
