//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a 
//short period of time.

class AoE_Ring {
  
    float x, y, vx, vy, d, hp;
   float count;
    
    AoE_Ring( float _x, float _y){
      x = _x;
      y = _y;
      d = 50;
      count = 0;
}

void show() {
  stroke(white);
  fill(white);
  circle(x, y, d);
}

void act() {
  int i =0;
  count++;
  if (count <= 20){
circle(x,y,40);
  Mob myMob =mobs.get(i);
  if (dist(myMob.x, myMob.y, x, y) < d/2 + myMob.d/2) {
    myMob.HP = myMob.HP - 1;
  }
  }  else if (count == 80){
    count = 0;
}
}
}
  

  
