PFont font;
int c = 90;
int G = 2;
float dt = 0.1;
float start = 0.0;
float end = 1110;
float speed = 267;
float x = 0.0;
float nans = 0;
void setup() {
  size(1200,1200);
  start = height / 2;
  font = loadFont("CambayDevanagari-Bold-48.vlw");
  textFont(font, 70);
}

void draw() {
  background(255);
  fill(0);
  stroke(0);
  strokeWeight(1);
  line(0, start, width, start);
  line(90, height/2 - 50, 90, height/2 + 50);
  line(1100, height/2 - 50, 1100, height/2 + 50);
  
  beginShape(QUADS);
  vertex(x, height/2 + 20);
  vertex(x, height/2 - 20);
  vertex(x + 80, height/2 - 20);
  vertex(x + 80, height/2 + 20);
  endShape();
  
  beginShape(QUADS);
  vertex(50, 200);
  vertex(50, 150);
  vertex(130, 150);
  vertex(130, 200);
  endShape();
  timer1(nans); 
 
  fill(0);
  beginShape(QUADS);
  vertex(1070, 200);
  vertex(1070, 150);
  vertex(1150, 150);
  vertex(1150, 200);
  endShape();
  timer2(nans); 
  
  veronicaTimer(nans, x);
  
  x = x + dt * c;
  if (x > end){
    noLoop();
  }
  
  nans = nans + dt;
}

void timer1(float dt){
  fill(255);
  String nan = str(dt);
  text(nan, 50, 200);
}

void timer2(float dt){
  fill(255);
  String nan = str(dt);
  text(nan, 1071, 200);
}

void veronicaTimer(float dt, float x1){
  fill(0);
  String nan = str(0.8 * dt);
  text(nan, x1, height/2 - 60);
}
