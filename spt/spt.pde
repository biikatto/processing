size(1024,1024);
colorMode(HSB);
background(255);

strokeJoin(ROUND);
strokeWeight(4);
strokeCap(SQUARE);

int n = 16384;
int step = 16;

int inc = 1;

int hue = (int)random(255);
int sat = 127;
int brt = 127;
int alpha = 82;

PVector last, current;
current = new PVector(width/2, (height/2) + 16);
last = new PVector();
last.x = current.x;
last.y = current.y;

int direction = 2;
boolean clockwise = false;
float[] startAngles = {
  TAU/4.0,
  TAU/2.0,
  3*TAU/4.0,
  0
};

float[] stopAngles = {
  TAU/2.0,
  3*TAU/4.0,
  TAU,
  TAU/4.0
};

noFill();

for(int i=0;i<n;i++){
  //int thisStep = 1;
  //while(thisStep == 0){
  //  thisStep = (int)random(step*-1, step);
  //}
  //if(random(0,1)>0.5){
  //  step = 16;
  //}else{
  //  step = 32;
  //}

  if(direction < 2 && current.x + step >= width){
    println("x >= width");
    println(current);
    println(direction);
    println(clockwise);
    if(direction == 2){
      direction = 1;
    }else if(direction == 3){
      direction = 0;
    }
    //clockwise ^= true;
    println(direction);
    println(clockwise);
    println();
  }else if(direction > 1 && current.x - step <= 0){
    println("x <= 0");
    println(current);
    println(direction);
    println(clockwise);
    if(direction == 0){
      direction = 3;
    }else if(direction == 1){
      direction = 2;
    }
    //clockwise ^= true;
    println(direction);
    println(clockwise);
    println();
  }

  if(current.y + step >= height){
    println("y >= height");
    println(current);
    println(direction);
    println(clockwise);
    if(direction == 3){
      direction = 2;
    }else if(direction == 0){
      direction = 1;
    }
    //clockwise ^= true;
    println(direction);
    println(clockwise);
    println();
  }else if(current.y - step <= 0){
    println("y <= 0");
    println(current);
    println(direction);
    println(clockwise);
    if(direction == 1){
      direction = 0;
    }else if(direction == 2){
      direction = 3;
    }
    //clockwise ^= true;
    println(direction);
    println(clockwise);
    println();
  }

  if(direction > 1){ // 2 or 3
    current.x += step;
  }else{  // 0 or 1
    current.x -= step;
  }

  if((direction == 0) || (direction == 3)){  // 0 or 3
    current.y += step;
  }else{
    current.y -= step;
  }




  stroke(hue, sat, brt, alpha);
  if(clockwise){
    if(direction % 2 == 0){
      arc(last.x, current.y, abs(current.x - last.x) * 2, abs(current.y - last.y) * 2, startAngles[(direction+1)%4], stopAngles[(direction+1)%4]);
    }else{
      arc(current.x, last.y, abs(current.x - last.x) * 2, abs(current.y - last.y) * 2, startAngles[(direction+1)%4], stopAngles[(direction+1)%4]);
    }
  }else{
    if(direction % 2 == 0){
      arc(current.x, last.y, abs(current.x - last.x) * 2, abs(current.y - last.y) * 2, startAngles[(direction+3)%4], stopAngles[(direction+3)%4]);
    }else{
      arc(last.x, current.y, abs(current.x - last.x) * 2, abs(current.y - last.y) * 2, startAngles[(direction+3)%4], stopAngles[(direction+3)%4]);
    }
  }
  if(random(0.0, 1.0) > 0.5){
    if(clockwise){
      //clockwise ^= true;
      direction -= 1;
    }else{
      //clockwise ^= true;
      direction += 1;
    }
    direction += 4;
    direction %= 4;
  }else{
    clockwise ^= true;
  }
  //strokeWeight(1);
  //line(last.x, last.y, current.x, current.y);
  strokeWeight(4);

  //switch(direction){
  //  case 0:
  //    arc(last.x, current.y, abs(current.x - last.x) * 2, abs(current.y - last.y) * 2, startAngles[direction], stopAngles[direction]);
  //  case 1:
  //    arc(last.x, current.y, abs(current.x - last.x), abs(current.y - last.y), startAngles[direction], stopAngles[direction]);
  //  case 2:
  //    arc(last.x, current.y, abs(current.x - last.x), abs(current.y - last.y), startAngles[direction], stopAngles[direction]);
  //  case 3:
  //    arc(last.x, current.y, abs(current.x - last.x), abs(current.y - last.y), startAngles[direction], stopAngles[direction]);
  //}
  //line(last.x, last.y, current.x, current.y);

  last.x = current.x;
  last.y = current.y;
  brt += inc;
  if(brt >= 255){
    brt = 255;
    inc *= -1;
  }else if(brt <= 0){
    brt = 0;
    inc *= -1;
  }
}

noStroke();
fill((int)random(255),127,127,127);
rect(0,0,width,height);

save("spt61.png");
