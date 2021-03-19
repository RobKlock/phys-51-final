PFont font;
float c = 1000; // For my own sake, C (the speed of light) is scaled down to be 1000
float dt = 0.1;
float start = 0.0;
float end = 0.0;
float speed_factor = .02;
float speed = speed_factor * c;
float x = 0.0;
float nans = 0;

// A nan is the amount of time it takes light to travel exactly one foot.
// In this example, we have a 1000 foot long track
void setup() {
  size(1600,1200);
  start = 200;
  end = 1200;
  font = loadFont("CambayDevanagari-Bold-48.vlw");
  textFont(font, 50);
}

void draw() {
  background(255);
  fill(0);
  stroke(0);
  strokeWeight(1);
  text("Length of track: 1000 ft", height/2 - 100, 800);
  text("Time in nans", start - 70, 250);
  text("Time in nans", end - 70, 250);
  line(0, height/2, width, height/2);
  line(start, height/2 - 50, start, height/2 + 50);
  line(end, height/2 - 50, end, height/2 + 50);
  
  beginShape(QUADS);
  vertex(x, height/2 + 20);
  vertex(x, height/2 - 20);
  vertex(x + 80, height/2 - 20);
  vertex(x + 80, height/2 + 20);
  endShape();
  
  beginShape(QUADS);
  vertex(start - 70, 200);
  vertex(start - 70, 150);
  vertex(start + 70, 150);
  vertex(start + 70, 200);
  endShape();
  timer1(nans); 
 
  fill(0);
  beginShape(QUADS);
  vertex(end - 70, 200);
  vertex(end - 70, 150);
  vertex(end + 80, 150);
  vertex(end + 80, 200);
  endShape();
  timer2(nans); 
  
  veronicaTimer(nans, x);
  draw_c(x);
   
  if (x > end){
    noLoop();
  }
  
  if (x > start){
    nans = nans + dt;
  }
  x = x + dt * speed;
}

void timer1(float dt){
  fill(255);
  String nan = str(dt * 1000);
  text(nan, start - 70, 200);
}

void timer2(float dt){
  fill(255);
  String nan = str(dt * 1000);
  text(nan, end - 70, 200);
}

void veronicaTimer(float dt, float x1){
  fill(0);
  float square_root_factor = sqrt(1 - ((speed * speed)/(c * c)));
  String nan = str(square_root_factor * dt * 1000);
  text(nan, x1, height/2 - 60);
}

void draw_c(float x){
  fill(0);
  String drawn_c = "V = " + str(speed_factor) + "c ->";
  text(drawn_c, x, height/2 + 80);
}
