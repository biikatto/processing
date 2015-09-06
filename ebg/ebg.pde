void setup(){
  size(1800, 1013);
  colorMode(RGB, width, height, width*height);
  int rMod = width/3;
  int gMod = height/5;
  int bMod = (width*height)/7;
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      stroke(color((i*rMod)%width, (j*gMod)%height, (i*j*bMod)%(width*height)));
      point(i,j);
    }
  }
  save("background.png");
}
