//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

//(0, 400, 1, )
class Mob {

  float x, y, vx, vy, d;
  float HP, maxHP;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y =_y;
    vx = _vx;
    vy = _vy;
    d= 40;
    HP = 20;
    maxHP = 20;
    
  }

  void show() {
    fill(blue);
    strokeWeight(3);
    circle(x, y, d);
    healthbar();
  }

  void act() {
    x = x +vx;
    y = y+ vy;

    int i =0;
        while (i< bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        HP = HP - 1 ;
        myBullet.hp = myBullet.hp - 1;
      }
      i ++;
    }
      i = 0;
    while ( i< nodes.length) {
      if ( dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
     i++;
    }
  }
  
  void healthbar(){
    rectMode (CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);
    fill(purple);
    rect(x-25, y-(d+10), 50, 20);
    fill(blue);
    rect(x-25, y-(d+10), HP*50/maxHP, 20);
    rectMode(CENTER);
  }
}
  
