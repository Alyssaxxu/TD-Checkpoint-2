//This function draws the BUILD screen
int count = 0;

void build() {
  drawMap();
  animateThings();

    drawBuildInterface();
  buildButtons();
  flashingSign();
  handleButtonClicks();
  handleBuildClicks();
}

void flashingSign() {
  fill(blue);
  println(count);
  count++;
  if (count <= 20){
    textSize(20);
text ("BUILD MODE", 900,70);
  }  else if (count == 40){
    count = 0;
}
  }


void buildButtons () {
  Play.show();
  Gun.show();
  Burst.show();
}

void drawBuildInterface() {
  stroke(purple);
  fill(white);
  rect(900, height/2, 200, height);
}

void handleBuildClicks() {
  if (Play.clicked) {
    mode = PLAY;
  }
  if (Gun.clicked && money >= 30) {
    towerType = 1;
    towers.add(new Tower(0, 0, 0, 40));
  }
  
  //if (Burst.clicked){
  //  towerType= 2;
  //  towers.add(new Tower(0,0,0, 40));
  //}
}
