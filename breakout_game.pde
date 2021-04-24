//Lucas Ortiz Molina;
//April 23, 2021;
//Block: 1-1a;

//=============================================
/* Description of added features

1) I've designed a different pattern for the bricks shifting every 
    other row to the right (used "modulo" from Processing reference to shift at even values of i)
2) gif in GAMEOVER mode for winning and losing resutls
3) the color of "SCORE and LIVES" changes according with the color of lower row available.
    For example: it starts green (color of lower row) and changes to another color when all
                 green balls are broken. The second color is the color of the lower row left.
                 So when there is only one ball left, "SCORE and LIVES" display its color
4) when there is only 1 life left, a "danger" sound effects turns on. 
      It stops when it finishes or at GAMEOVER page (whatever comes first)
5) where there is only 1 ball left, a "cheering" sound effect turns on and stops when the song is over.
*/
//=============================================

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

// sound variables
Minim minim;
AudioPlayer intro, broken, life, bounce, danger, lastpt, win, lose;

// gif array intro
PImage [] gifi;
int frameNi;
int fi;

// gif array win
PImage [] gif;
int frame;
int f;

// gif array lose
PImage [] gifl;
int framel;
int fl;

// timer variables
int timer;

// paddle variables
float px, py, pd;

// ball variables
float bx, by, bd;
float vx, vy;

// fonts
PFont breakout;

// images
PImage inspace;
PImage gaspace;

// color pallette
color lime = #AAFF00;
color lava = #FFAA00;
color watermelon = #FF00AA;
color purple = #AA00FF;
color sea = #00AAFF;
color blood = #DF151A;
color leaf = #00DA3C;
color banana = #F4F328;
color paddle = #7037CD;

// keyboard variables
boolean akey, dkey;

// array variables
int[] x;
int[] y;
int pgs;
int brickd;
int tempx, tempy, shiftx;
boolean[] alive;

// score variables
int score;
int lives;

void setup () {
  size(1000, 700);
  mode = GAMEOVER; 

  // images
  imageMode(CENTER);
  inspace = loadImage("space_intro.jpg");
  gaspace = loadImage("space_game.png");

  // fonts
  breakout = loadFont("ChalkboardSE-Regular-48.vlw");

  // paddle variables
  px = width/2;
  py = height;
  pd = 250;

  // ball variables
  bx = width/2;
  by = height/2 + 100;
  bd = 20;
  vx = random(-2, 2);
  vy = 5;

  // keyboard variables
  akey = dkey = false;

  // brick variables
  pgs = 36;
  x = new int[pgs];
  y = new int[pgs];
  alive = new boolean[pgs];
  brickd = 50;
  tempx = 100;
  shiftx = 50;
  tempy = 50;
  int i = 0;
  while (i < pgs) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx >= width && i%2 == 0) {
     tempx = 100 + shiftx;
     tempy = tempy + 100;
    } else if (tempx >= width && i%2 != 0){
      tempx = 100;
     tempy = tempy + 100;
    }
    i = i+1;
  }
  
  // score variables
  score = 0;
  lives = 3;
  
  // timer variables
  timer = 100;
    
  // gif array intro
  frameNi = 9;
  gifi = new PImage [frameNi];
  fi = 0;
  int l = 0;
  while (l < frameNi) {
  gifi[l] = loadImage("frame_"+l+"_delay-0.1s.gif");
  l++;
  }
  
  // gif array win
  frame = 10;
  gif = new PImage [frame];
  f = 0;
  int g = 0;
  while (g < frame) {
    gif[g] = loadImage("framew_"+g+"_delay-0.1s.gif");
    g++;
  }
  
  // gif array lose
  framel = 10;
  gifl = new PImage [framel];
  fl = 0;
  int t = 0;
  while (t < framel) {
    gifl[t] = loadImage("framel_"+t+"_delay-0.1s.gif");
    t++;
  }
  
  // minim
  minim = new Minim(this);
  broken = minim.loadFile("broke.mp3");
  life = minim.loadFile("life.mp3");
  bounce = minim.loadFile("bounce.mp3");
  danger = minim.loadFile("danger.wav");
  lastpt = minim.loadFile("winning.wav");
  win = minim.loadFile("win.mp3");
  lose = minim.loadFile("lose.mp3");
  intro = minim.loadFile("intro.mp3");
}

void draw () {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pausescreen();
  } 
}
