void setup(){
  size(851, 315);
  int n = 4;
  for(int i=0;i<width;i++){
    float x = (float)i/width;
    for(int j=0;j<height;j++){
      float y = (float)j/height;
      if(x>0 && y>0){
        if(y>x){
          stroke(x/y*255);
        }else{
          stroke(y/x*255);
        }
      }else{
        stroke(0);
      }
      if(((i+j)%n) == 0){
        stroke(0);
      }else if(((abs(i-j))%n == 0)){
        stroke(255);
      }
      point(i,j);
    }
  }

  stroke(0);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(0, 0, width, height);

  stroke(63);
  line(width/4, 0, width, 3*height/4);
  line(0, height/4, 3*width/4, height);

  stroke(127);
  line(0, height/2, width/2, height);
  line(width/2, 0, width, height/2);

  stroke(191);
  line(3*width/4, 0, width, height/4);
  line(0, 3*height/4, width/4, height);

  stroke(223);
  line(7*width/8, 0, width, height/8);
  line(0, 7*height/8, width/8, height);

  stroke(239);
  line(15*width/16, 0, width, height/16);
  line(0, 15*height/16, width/16, height);

  stroke(247);
  line(31*width/32, 0, width, height/32);
  line(0, 31*height/32, width/32, height);

  save("ubt5_n4.png");
  noLoop();
}
