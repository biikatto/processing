size(1024,1024);
colorMode(HSB);

int colors = 1025;
randomSeed(7);

int[] kernel = new int[colors];

for(int i=0;i<colors;i++){
  kernel[i] = color((i*((float)128/colors)+64), 255, 127);
}

for(int i=0;i<colors;i++){
  int temp = kernel[i];
  int rand = (int)random(colors);
  kernel[i] = kernel[rand];
  kernel[rand] = temp;
}

for(int x=0;x<width;x++){
  for(int y=0;y<height;y++){
    stroke(kernel[(x+(y*width))%colors]);
    point(x,y);
  }
}

kernel = shorten(kernel);
kernel = shorten(kernel);
colors -= 2;

for(int i=0;i<colors;i++){
  kernel[i] = color(hue(kernel[i]), saturation(kernel[i]), brightness(kernel[i]), 127);
}

for(int x=0;x<width;x++){
  for(int y=0;y<height;y++){
    stroke(kernel[(x+(y*width))%colors]);
    point(x,y);
  }
}

save("kld32.png");
