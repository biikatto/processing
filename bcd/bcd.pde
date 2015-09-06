size(1024,1024);
colorMode(HSB);

translate(0,height);

//background(127,227,80);
background(24);

int n = 1024;

for(int r=2;r<1024;r++){
  for(int i=0;i<n;i++){
    stroke(((float)i/n)*255, r/2, 127);
    float phase = TAU * ((float)i/n);
    point(r*sin(phase), r*cos(phase));
  }
}

save("bcd12.png");
