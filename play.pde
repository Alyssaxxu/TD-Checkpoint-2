//This function draws the PLAY screen
int n = 0;
int m = 0;
//Mob [] mobs;
void play() {

  drawMap();
  animateThings();
  drawPlayInterface();
  handleButtonClicks();
}

void drawMap() {

  background(black);

  stroke( pink);
  strokeWeight(30);
  line(0, 400, 200, 400);
  line(200, 400, 200, 650);
  line(200, 650, 400, 650);
  line(400, 650, 400, 300);
  line(400, 300, 300, 300);
  line(300, 300, 300, 150);
  line(300, 150, 600, 150);
  line(600, 150, 600, 400);
  line(600, 400, 800, 400);

  // reset stroke
  stroke(black);
  strokeWeight(2);

  //temporary node drawing space
  int i = 0;
  while (i< 8) {
    nodes[i].show();
    i++;
  }
}

void drawPlayInterface() {
  //toolbar
  stroke(purple);
  fill(purple);
  rect(900, 400, 200, 800);
  // 
  fill(pink);
  textFont (Paladins);
  textSize(20);
  //n = Play.
  text ( "Next Wave:" + n, 900, 50);
  text( "$: " + money, 900, 80);
  Play.show();
  Build.show();
}

void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.HP <= 0) {
      mobs.remove(i);
      money ++;
    } else {
      i++;
    }
  }

  i=0;
  while (i< towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0)
    myTower.act();
    myTower.show();
    i++;
  }
  i=0;
  while (i< bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <=0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  //i=0;
  //while (i< AoE_Rings.size()) {
  //  AoE_Ring myAoE_Ring = AoE_Rings.get(i);
  //  myAoE_Ring.act();
  //  myAoE_Ring.show();
  //    i++;
  //  }
}

void handleButtonClicks() {
  int i =-1;
  int x =0;
  if (mobs.size() < 1) {
    if (Play.clicked) {
      while ( i< n) {
        mobs.add(new Mob(x, 400, 1, 0));
        x = x - 50;
        i++;
      }
      n ++;
    }
  }
  
  if (Build.clicked){
    mode = BUILD;
  }
}
