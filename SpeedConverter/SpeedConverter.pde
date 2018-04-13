int x=0;
int y=0;
int cx, cy, cv;
float secondsRadius;
void setup() {
  size(850, 600);
  //if you want to change the size, use int radius and change the very end after ).
  int radius = min(width, height) / 2-70;
  secondsRadius = radius*.72;
  //cx is where the circle needs to be the circle to the left 
  cx = width / 2/2;
  cy = height / 2;
  //cv is where the second circle needs to be, the circle to the right
  cv = width /2 + width/2/2;
}
void draw() {
  background(85);
  textAlign(CENTER);
  textSize(22);
  text("Speed Converter", width/2, y+20);
  textSize(15);
  text("By: IG9626", width/2, y+40);
  text("Miles per Hour:"+ (KilometersperhourConverter(mouseX)), width/2/2, y+100);
  //so that you can see were the mouse is on the screen
  noStroke();
  ellipse(width/2/2, height/2-5, 300, 300);
  text("Kilometers per Hour:"+ milesperhourConverter(mouseX), width/2+ width/2/2, y+100);
  ellipse(width/2+width/2/2, height/2-5, 300, 300);
  rect(0, width/2+100, (mouseX), 50);
  text(mouseX, mouseX+20, 550);
  //tickmarks as numbers circle to left
  for (int a = 0; a < 360; a+=10) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
    text(a, x, y);
  }
  //tickmarks as numbers circle to the right (kilometers per hour)
  for (int a = 0; a < 360; a+=10) {
    float angle = radians(a);
    float x = cv + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
    text(a, x, y);
  }
  float s = map(mouseX, 0, 60, 0, TWO_PI);
    //float s = map(mouseX, 0, 60, 0,TWO_PI);
  //hands of the clock
  stroke(0);
  strokeWeight(1);
  //circle to the left
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  //circle to the right
  line(cv, cy, cv + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
}

float KilometersperhourConverter(float val) {
  val = val*0.621137119223733;
  return val;
}
float milesperhourConverter(float val) {
  val = val*1.609344;
  return val;
}
