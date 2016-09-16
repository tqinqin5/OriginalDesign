int screenSize = 600;
float x = 10;
float y = 10;
int count = 0;
float a = 0;
float b = 0;
int max = 50;
int re;
int gr;
int bl;
int ratiox;
int ratioy;
int sizeCoordinateX = 2;
int sizeCoordinateY = 2;
int score;
int shape = 1;
int o;
int p;

void setup(){
  size(screenSize,screenSize);
  background(0,0,0);
  noLoop();
}

void draw(){

  noStroke();
  re = (int)(random(50));
  gr = (int)(random(255));
  bl = (int)(random(50));
  fill(re,gr,bl);
  drawShape();
  count = count + 1;
  
  if(count > max){
  clear();
  count = 0;
  food();
  }
  
  if(abs((x - a))<10 && abs((y - b))<10){
  max = max + 1;
  sizeCoordinateX += 1;
  sizeCoordinateY += 1;
  score = 10*(max - 50);
  }
  particle();
}

void food(){
  gr = (int)(random(50));
  bl = (int)(random(50));
  a = (int)(50 + random(screenSize - 100));
  b = (int)(50 + random(screenSize - 100));
  fill(255,gr,bl);
  rect(a-5,b,10,10);
  quad(a,b,a+1,b+1,x+1,y+1,x,y);
}

void mouseMoved() {
  ratiox = abs(mouseX - floor(x));
  ratioy = abs(mouseY - floor(y));
  if(x<mouseX){
    x = x + (int)(ratiox/20);
  }
  else{
    x = x - (int)(ratiox/20);
  }
  if(y<mouseY){
  y = y + (int)(ratioy/20);
  }
  else{
  y = y - (int)(ratioy/20);
  }
  redraw();
}

void drawShape(){
    shape = floor(random(1, 4));
    if(shape < 2){
        ellipse(x,y,sizeCoordinateX,sizeCoordinateY);
    }
    if(shape >= 2 && shape < 3){
        rect(x-(floor(sizeCoordinateX/2)),y-(floor(sizeCoordinateY/2)),sizeCoordinateX,sizeCoordinateY);
    }
    if(shape >= 3){
        triangle(x, y - (floor(sizeCoordinateY/2)), x - (floor(sizeCoordinateX/2)), y + (floor(sizeCoordinateY/2)), x + (floor(sizeCoordinateX/2)), y + (floor(sizeCoordinateY/2)));
    }  
}

void keyPressed(){
  sizeCoordinateX = 2;
  sizeCoordinateY = 2;
  count = 0;
  clear();
}

void particle(){
  o = (int)(random(screenSize));
  p = (int)(random(screenSize));
  re = (int)(random(50));
  gr = (int)(random(50));
  bl = (int)(random(50));
  fill(150+re,50+gr,bl);
  rect(o,p,5,5);
}
