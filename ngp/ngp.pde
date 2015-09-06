size(1024,1024);
colorMode(HSB);
randomSeed(0);
translate(width/2, height/2);
//strokeWeight(2);
background(24);

PVector[] points = new PVector[128];

color[] colors = new color[points.length];

for(int i=0;i<points.length;i++){
  //points[i] = new PVector((int)random(width), (int)random(height));
  float theta = (float)i/points.length * TAU;
  float mag = (width/2)-1;
  points[i] = new PVector(mag*sin(theta), mag*cos(theta));
  colors[i] = color(((float)i/points.length)*255, 192, 192, 127);
}

noFill();

for(int i=1;i<16;i++){
  stroke(((float)i/16)*255, 192, 192);
  ellipse(0,0,(width-1)/i,(height-1)/i);
}

int offset = (points.length/2) - 1;

for(int i=0;i<points.length;i++){
  stroke(colors[i]);
  line(
      points[i].x, points[i].y,
      points[(i+offset)%points.length].x, points[(i+offset)%points.length].y);
}

for(int i=0;i<points.length;i++){
  stroke(colors[i]);
  line(
      points[i].x, points[i].y,
      points[(i+offset)%points.length].x, points[(i+offset)%points.length].y);
}

for(int i=0;i<points.length;i++){
  stroke(colors[i]);
  line(
      points[i].x, points[i].y,
      points[(i+offset)%points.length].x, points[(i+offset)%points.length].y);
}

save("ngp18.png");
