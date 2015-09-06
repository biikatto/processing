size(1024,1024);
translate(width/2, height/2);
colorMode(HSB);
background(182);

strokeWeight(3);

int radius = 512;
PVector[] points = new PVector[16];

for(int i=0;i<points.length;i++){
  float phase = ((float)i/points.length) * TAU;
  points[i] = new PVector(radius*(sin(phase)), radius*(cos(phase)));
}

/*
for(int i=0;i<points.length;i++){
  stroke(0, 0, ((float)i/points.length)*255);
  for(int j=i+1;j<points.length;j++){
    if(i != j){
      line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
  }
}
*/

colorMode(RGB);

float[][] left_sobel = {
  {1, 0, -1},
  {2, 0, -2},
  {1, 0, -1}
};

/*
loadPixels();

float[][] kernel = left_sobel;

for(int x=1;x<width-1;x++){
  for(int y=1;y<height-1;y++){
    float rsum = 0;
    float gsum = 0;
    float bsum = 0;
    int pos = x + (y*width);
    for(int ky=0;ky<kernel.length;ky++){
      for(int kx=0;kx<kernel[ky].length;kx++){
        int kpos = x+(kx-1) + ((y+(ky-1))*width);
        rsum += kernel[ky][kx] * red(pixels[kpos]);
        gsum += kernel[ky][kx] * blue(pixels[kpos]);
        bsum += kernel[ky][kx] * green(pixels[kpos]);
      }
    }
    pixels[pos] = color((int)rsum, (int)gsum,(int)bsum);
  }
}

updatePixels();
*/

save("fni13.png");
