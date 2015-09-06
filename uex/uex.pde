int x_repeats = 80;
int y_repeats = 120;
int iterations = 1;

void setup(){
  size(500,500);
  colorMode(HSB, 1.0);
  for(int i=0;i<iterations;i++){
    for(int x=0;x<width;x++){
      for(int y=0;y<height;y++){
        stroke(color(
              0.1,
              float(((x*x_repeats)%width)*((y*y_repeats)%height))/(width*height),
              float(x)/width,
              float(y)/height));
        point(x,y);
      }
    }
    translate(width/2,height/2);
    rotate(0.25*TAU);
    translate(-width/2,-height/2);
  }
}
void draw(){}
