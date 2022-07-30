int r;
float xSmoke, ySmoke, xSmoke2, ySmoke2, delay, xRoad, xCar, xMountain, xMountain2;
int x = 0;
int y = 400;
boolean lightMode = true;
float h = 0;
int num = 100;
int i = 10;
float xRain = random(width);
float yRain = random(height);
float yspeed = 100;

void setup(){
  size(1280, 720);
  background(#e3f4fe);
  frameRate(60);
  
  r = 3;
  xSmoke = 0;
  ySmoke = 0;
  xSmoke2 = 0;
  ySmoke2 = 0;
  xRoad = 0;
  xMountain = 0;
  xMountain2 = 0;
  xCar = 1600;
  
  delay = 3.7;
}

void draw() {
  noStroke();
  
  background(#e3f4fe);
  xRoad = xRoad - 5;
  xMountain = xMountain - 2;
  xMountain2 = xMountain2 - 3;
  xCar = xCar - 8;
  
  r = r - 3;
  xSmoke = xSmoke - 0.2;
  ySmoke = xSmoke - 0.4;
  
  delay = delay - 0.1;
  
  if(ySmoke <= -15){
    xSmoke = 0;
    ySmoke = 0;
  }
  
  if(ySmoke2 <= -15){
    xSmoke2 = 0;
    ySmoke2 = 0;
  }
  
  if(delay <= 0) {
    xSmoke2 = xSmoke2 - 0.2;
    ySmoke2 = xSmoke2 - 0.4;
  }
  
  if(xRoad <= -1280){
    xRoad = 0;
  }
  
  if(xMountain <= -1280){
    xMountain = 0;
  }
  
  if(xMountain2 <= -1580){
    xMountain2 = -300;
  }
  
  if(xCar <= -400){
    xCar = 1600;
  }
  
  if(lightMode){
    fill(#e3f4fe);
  }
  
  else{
    fill(#434343);
  }
  rect(0,0,1280,720);
  
  //matahari
  noStroke(); 
  fill(#FFCE08);
  ellipse(x, y, 85, 85); 
  
  if(!lightMode){
    fill(#434343);
    ellipse(x + 10, y, 75, 75); 
  }

  x++;
  
  if(y < 90 || x > 920){
    y++; 
  }
  
  else{
     y--; 
  }
  
  if(x > 1365){
    x = 0; 
    
    if(lightMode){
       lightMode = false;
    }
    
    else{
      lightMode = true;
    }
  }
  
  noStroke();
  
  noStroke();
  pushMatrix();
  translate(xMountain,100);
  mountain(#4d9f4c);
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xMountain + 1275,100);
  mountain(#4d9f4c);
  popMatrix();
  
  if(lightMode){
    fill(#FFFFFF);
  }
  
  else{
    fill(#AFAFAF);
  }
  
  ellipse(100-h,160,70,45);
  ellipse(150-h,160,95,65);
  ellipse(200-h,160,70,45);
  
  ellipse(300-h,120,70,45);
  ellipse(350-h,120,95,65);
  ellipse(400-h,120,70,45);
  
  ellipse(700-h,100,70,45);
  ellipse(750-h,100,95,65);
  ellipse(800-h,100,70,45);
  
  ellipse(840-h,160,70,45);
  ellipse(890-h,160,95,65);
  ellipse(940-h,160,70,45);
  
  //
  
  ellipse(100-h+1280,160,70,45);
  ellipse(150-h+1280,160,95,65);
  ellipse(200-h+1280,160,70,45);
  
  ellipse(300-h+1280,120,70,45);
  ellipse(350-h+1280,120,95,65);
  ellipse(400-h+1280,120,70,45);
  
  ellipse(700-h+1280,100,70,45);
  ellipse(750-h+1280,100,95,65);
  ellipse(800-h+1280,100,70,45);
  
  
  ellipse(840-h+1280,160,70,45);
  ellipse(890-h+1280,160,95,65);
  ellipse(940-h+1280,160,70,45);
  
  h += 1.5;
  
  if(h >= 1280) {
    h = 0;
  }
  
  pushMatrix();
  translate(300, 60);
  pushMatrix();
  translate(xMountain2,100);
  mountain(#436e43);
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xMountain2 + 1275,100);
  mountain(#436e43);
  popMatrix();
  popMatrix();
  
  fill(#2AC635);
  rect(0, 400, 1280, 420);
  
  pushMatrix();
  translate(xRoad,0);
  road();
  popMatrix();
  
  pushMatrix();
  translate(xRoad + 1275,0);
  road();
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xRoad,330);
  tree(10);
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xRoad + 1275,330);
  tree(10);
  popMatrix();
  
  pushMatrix();
  translate(540,410);
  car(#0212BC);
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xCar,510);
  scale(-1, 1);
  car(#D80019);
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xRoad,600);
  tree(100);
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(xRoad + 1275,600);
  tree(100);
  popMatrix();
  
  if(!lightMode){
    fill(color(0, 0, 0, 60));
    rect(0, 0, 1280, 720);
    
    if (i < num){
    fall();
    show();
    delay(1);
    }
  }
}

void wheel(){
  fill(#5A5A58);
  circle(0, 0, 40);
  
  fill(#050505);
  circle(0, 0, 25);
  
  line(-10, 0, 10, 0);
  line(0, -10, 0, 10);
}

void smoke(){
  fill(#CECECE);
  circle(-10, 90, 8);
}

void car(int x) {
  rectMode(CENTER);
  
  pushMatrix();
  translate(xSmoke,ySmoke);
  smoke();
  popMatrix();
  
  pushMatrix();
  translate(xSmoke2,ySmoke2);
  smoke();
  popMatrix();
  
  fill(#1A1A1A);
  rect(0, 90, 20, 10);
  
  fill(x);
  beginShape();
  vertex(0, 60);
  vertex(10, 50);
  vertex(50, 50);
  vertex(80, 20);
  vertex(130, 20);
  vertex(160, 50);
  vertex(200, 50);
  vertex(210, 60);
  vertex(210, 100);
  vertex(0, 100);
  endShape(CLOSE);
  
  fill(#E5E5E5);
  beginShape();
  vertex(110, 26);
  vertex(125, 26);
  vertex(150, 50);
  vertex(110, 50);
  endShape(CLOSE);
  
  if(lightMode){
    fill(#FFFFFF);
    rect(200, 70, 20, 15);
  }
  else{
    fill(#FEFF24);
    rect(200, 70, 20, 15);
    
    fill(color(254, 255, 36, 100));
    beginShape();
    vertex(210, 63);
    vertex(280, 30);
    vertex(280, 110);
    vertex(210, 77);
    endShape(CLOSE);
  }
  
  pushMatrix();
  stroke(#5A5A58);
  strokeWeight(3);
  translate(50,100);
  rotate(r);
  wheel();
  popMatrix();
  
  pushMatrix();
  translate(165,100);
  rotate(r);
  wheel();
  popMatrix();
}

void road(){
  int l=20;
  int post=40;
  
  noStroke();
  rectMode(CORNER);
  fill(#808080);
  rect(0,450,1280,220);
  strokeWeight(3);
  stroke(0);
  line(0,450,1280,450);
  line(0,670,1280,670);
  
  stroke(250);
  for(int i = 0; i < 33; i++){
    line(l,560,post,560);
    post+=40;
    l+=40;
  }
}

void tree(int x) {
  rectMode(CORNER);
  
  int a = 1130 + x;
  int b = 1170 + x;
  int c = 1210 + x;
  int r = 1155 + x;
  
  for (int i = 0; i <= 5; i++) {
    fill(#FF8F05);
    rect(r, 90, 30, 20);
    
    fill(#00890A);
    triangle(a, 50, c, 50, b, -10);
    triangle(a, 70, c, 70, b, 10);
    triangle(a, 90, c, 90, b, 30);
    
    a-=212;
    b-=212;
    c-=212;
    r-=212;
  }
}

void mountain(int x){
  fill(x);
  beginShape();
  curveVertex(650,  364);
  curveVertex(600,  364);
  curveVertex(400,  76);
  curveVertex(250,  68);
  curveVertex(0, 364);
  curveVertex(-55, 364);
  endShape(CLOSE);

  beginShape();
  curveVertex(1010,  364);
  curveVertex(960,  364);
  curveVertex(760,  200);
  curveVertex(610,  200);
  curveVertex(425, 364);
  curveVertex(370, 364);
  endShape(CLOSE);

  beginShape();
  curveVertex(1230,  250);
  curveVertex(1300,  364);
  curveVertex(1150,  150);
  curveVertex(1000,  150);
  curveVertex(800, 364);
  curveVertex(700, 364);
  endShape(CLOSE);
}

void fall() {
  yRain = yRain + yspeed;
  xRain = random(width);
  if (yRain > height) {
    yRain = random(height);
  }
}

void show() {
  stroke(#27C8F2);
  line(xRain, yRain, xRain, yRain+10);
}
