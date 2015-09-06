void setup(){
  size(200,200);
  colorMode(RGB, width, height, width*height);
  int seed = int(random(65536));
  randomSeed(seed);
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      stroke(
          (i*(seed&0xF))%width,
          (j*((seed>>8)&0xf))%height,
          (i*j*((seed>>16)&0xf))%(width*height));
      point(i, j);
    }
  }
  save("200x200/"+seed+".png");
}
