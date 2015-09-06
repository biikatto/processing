int rows = 32;
int rowSize = 0;

int columns = 64;
int columnSize = 0;

float hueRange = 0.6;
float hueOffset = 0.5;

float bgS = 0.2;
float bgB = 0.2;

float circleS = 0.7;
float circleB = 0.8;

void setup(){
  size(2560, 1440);
  rowSize = height / rows;
  columnSize = width / columns;
  ellipseMode(CENTER);
  colorMode(HSB, 1.0);
  background(color(hueOffset, bgS, bgB));
  for(int x=0;x<columns;x++){
    int xPos = x * columnSize;
    for(int y=0;y<rows;y++){
      int yPos = y * rowSize;

      int size = (int)(columnSize * max((float(y)/x+1), (float(x)/y+1)));
      size = (int)(rowSize * (float(columns*rows) /(x*y)));
      println(size);

      float phase = (float)(y*columns + x) / (rows*columns);

      float hue = hueOffset + (hueRange * phase);

      stroke(color(hue, bgS, bgB));
      fill(color(hue, circleS, circleB, 0.02));

      ellipse(xPos, yPos, size, size);
    }
  }
  save("exc4.png");
}

void draw(){}
