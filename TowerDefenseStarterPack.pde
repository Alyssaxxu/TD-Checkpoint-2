//Tower Defense Game
//Alyssa Xu
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode;

//Pallette
color pink = #ff595e;
color orange = #ffca3a;
color green = #8ac926;
color blue = #1982c4;
color purple = #6a4c93;
color white = #ffffff;
color black = #000000;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, Play, Build, Gun, Burst;

//Collections of objects
Node [] nodes;
ArrayList <Mob> mobs;
ArrayList <Tower> towers;
ArrayList <Bullet> bullets;
ArrayList <AoE_Ring> AoE_Rings;

//Images and Gifs
Gif introGif;
PFont Paladins;
PImage play;

//Fonts

int money=30;
int towerType = 0;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introGif = new Gif("introGif/frame_", "_delay-0.05s.gif", 22, 1, width/2, height/2, width, height);
  play = loadImage( "play.png");

  //Load Fonts
  Paladins = createFont("font/paladins.ttf", 80);

  //Create Collections of Objects
  mobs = new ArrayList <Mob> ();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList <Bullet> ();
  AoE_Rings = new ArrayList <AoE_Ring> ();


}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);

  //PLAY - Next Wave, To Build Mode
  Play = new Button(play, 900, 150, 150, 80, white, black);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
Build = new Button ("BUILD", 900, 250, 150, 80, white, black);
Gun = new Button ("Gun", 900, 250, 150, 80, white, black);
Burst = new Button("Burst", 900, 350, 150, 80, white, black);
  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[8];

  nodes[0] = new Node(200, 400, 0, +1);
  nodes[1] = new Node(200, 650, +1, 0);
  nodes[2] = new Node (400, 650, 0, -1);
  nodes[3] = new Node (400, 300, -1, 0);
  nodes[4] = new Node (300, 300, 0, -1);
  nodes[5] = new Node(300, 150, +1, 0);
  nodes[6] = new Node (600, 150, 0, +1);
  nodes[7] = new Node (600, 400, +1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }

  textSize(20);
  text(mouseX + ", " + mouseY, mouseX, mouseY-20);
}
