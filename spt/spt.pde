ArcWalker aw = new ArcWalker();
int n = 2;
int id = 70;

void setup(){
  size(1024,1024);
  colorMode(HSB);
  background(255);

  strokeJoin(ROUND);
  strokeWeight(4);
  strokeCap(SQUARE);

  noLoop();

  int power = int(random(8, 13));
  n = int(pow(n, power));
}

void draw(){
  for(int i=0;i<n;i++){
    aw.draw_step();
  }
  aw.finish(str(id));
}

class ArcWalker{
  // number of steps in total

  // grid size (pixels)
  int step = 16;

  // brightness increment/decrement value
  int brt_inc = 1;

  // color for strokes
  int hue = 0;
  int sat = 127;
  int brt = 127;
  int alpha = 82;

  // stroke location information
  PVector last, current;

  // stroke orientation information
  int direction = 2;
  boolean clockwise = false;
  float[] startAngles = {
    TAU * 1.0/4.0,
    TAU * 1.0/2.0,
    TAU * 3.0/4.0,
    0
  };

  float[] stopAngles = {
    TAU * 1.0/2.0,
    TAU * 3.0/4.0,
    TAU,
    TAU * 1.0/4.0
  };

  ArcWalker(){
    hue = (int)random(255);

    current = new PVector(width/2, (height/2) + 16);
    last = new PVector();
    last.x = current.x;
    last.y = current.y;
  }

  void draw_step(){
    noFill();

    //int thisStep = 1;
    //while(thisStep == 0){
    //  thisStep = (int)random(step*-1, step);
    //}
    //if(random(0,1)>0.5){
    //  step = 16;
    //}else{
    //  step = 32;
    //}


    _step();

    _draw_arc();

    _change_direction();

    // reset last for next iteration
    last.x = current.x;
    last.y = current.y;

    // brightness increment and direction flip
    brt += brt_inc;
    if(brt >= 255){
      brt = 255;
      brt_inc *= -1;
    }else if(brt <= 0){
      brt = 0;
      brt_inc *= -1;
    }
  }

  void finish(String id){
    // transparent background applied after all strokes
    noStroke();
    fill((int)random(255),127,127,127);
    rect(0,0,width,height);

    save("spt{}.png".replace("{}", id));
  }

  void _draw_arc(){
    // draw arc from last to current
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

  }

  void _change_direction(){
    // randomly choose whether or not to turn next stroke
    // this is probably where we should check if we're going to be against the edge
    // (but we're not yet)
    boolean turn = random(0.0, 1.0) > 0.5;

    if(current.x + step >= width){
      if((direction == 2) || (direction == 3)){
        turn = true;
      }else{
        turn = false;
      }
    }
    if(current.x - step <= 0){
      if((direction == 0) || (direction == 1)){
        turn = true;
      }else{
        turn = false;
      }
    }
    if(current.y + step >= height){
      if((direction == 0) || (direction == 3)){
        turn = true;
      }else{
        turn = false;
      }
    }
    if(current.y - step <= 0){
      if((direction == 1) || (direction == 2)){
        turn = true;
      }else{
        turn = false;
      }
    }

    if(turn){
      // turn
      if(clockwise){
        direction -= 1;
      }else{
        direction += 1;
      }

      // constrain so 0 <= direction < 4
      direction += 4;
      direction %= 4;
    }else{
      // do not turn
      clockwise ^= true;
    }
  }

  void _step(){
    // 0: down and left
    // 1: up and left
    // 2: up and right
    // 3: down and right
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
  }

}
