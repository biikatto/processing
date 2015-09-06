void setup(){
  size(720, 960);

  PImage img;
  img = loadImage("howe_are_you.jpg");
  img.loadPixels();

  int mask = int(random(0xFFFFFF));
  // mask = 0x0F0F0F;
  mask = 0xFFFFFF;
  println(mask);
  // 8036147

  for(int i=0;i<height-1;i++){
    int[] row = subset(img.pixels, (i*width)+1, height);
    row = sortRow(row, mask);
    for(int j=0;j<row.length;j++){
      img.pixels[(i*width)+j] = (row[j] >> 1); // ^ 0x0F0F0F;
    }
  }

  img.updatePixels();
  image(img, 0, 0);
  save("howe_are_you_7.png");
}

int[] sortRow(int[] row, int mask){
  boolean sorted = false;
  while(!sorted){
    for(int i=0;i<row.length-1;i++){
      if((row[i] & mask) > (row[i+1] & mask)){
        int temp = row[i];
        row[i] = row[i+1];
        row[i+1] = temp;
      }
    }
    sorted = true;
    for(int i=0;i<row.length-1;i++){
      if((row[i] & mask) > (row[i+1] & mask)){
        sorted = false;
      }
    }
  }
  return row;
}
