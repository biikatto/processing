size(1024,1024);
background(255);
colorMode(HSB);

int hue = 127;
int sat = 227;

for(int n=2;n<32;n++){
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      if((x*y) % n == 0){
        stroke(hue, sat, (512/n), (255/(n/2)));
        point(x,y);
      }
    }
  }
}

save("ryk12.png");
