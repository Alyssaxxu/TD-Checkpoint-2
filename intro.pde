//This function draws the INTRO screen.

void intro() {

  introGif.show();
  start.show();
  if(start.clicked){
    mode = PLAY;
 
  }
     textAlign (CENTER, CENTER);
   textFont (Paladins);
   fill(pink);
  text ( "Tower", width/2 , height/2- 100);
  text ( "defense", width/2, height/2 );
}
