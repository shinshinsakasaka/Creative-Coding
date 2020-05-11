//photo:night by Alex Tai on Unsplash
//photo:night2 by Denis Shlenduhhov on Unsplash
//Reference: the coding train
//URL : https://www.youtube.com/watch?v=JUDYkxU6J0o


PImage img;
PImage sorted;

int c, d;
int k = 0;


void setup() {
  size(341, 512);
  //size(354, 512);
  //size(490, 368);
  img = loadImage("night.jpg");
  sorted = img.get();
  sorted.loadPixels();
  int c = - width / 2;
  int d = 0;
  for (int k = 1; k < height; k++) {
    c += width;
    d += width;
    for (int i = c; i < d; i += 1) {
      float record = 999;
      int selectedPixel = i;
      for (int j = i; j < d; j++) {
        color pix = sorted.pixels[j];
        float b = hue(pix);
        if (b < record) {
          selectedPixel = j;
          record = b;
        }
      }
      color temp = sorted.pixels[i];
      sorted.pixels[i] = sorted.pixels[selectedPixel];
      sorted.pixels[selectedPixel] = temp;
    }

    sorted.updatePixels();
  }
}

void draw() {
  background(0);
  image(sorted, 0, 0);
}

void mousePressed(){
  String s = nf(second());
  save(s + ".jpg");
}

//animation version
//void setup() {
//  size(341, 512);
//  //size(354, 512);
//  //size(490, 368);
//  img = loadImage("night.jpg");
//  sorted = img.get();
//  sorted.loadPixels();
//  c = - width / 2;
//  d = 0;
//}

//void draw() {
//  background(0);

//  k++;
//  if (k >= height) {
//    noLoop();
//  }
//  c += width;
//  d += width;
//  for (int i = c; i < d; i += 1) {
//    float record = 999;
//    int selectedPixel = i;
//    for (int j = i; j < d; j++) {
//      color pix = sorted.pixels[j];
//      float b = hue(pix);
//      if (b < record) {
//        selectedPixel = j;
//        record = b;
//      }
//    }
//    color temp = sorted.pixels[i];
//    sorted.pixels[i] = sorted.pixels[selectedPixel];
//    sorted.pixels[selectedPixel] = temp;
//  }

//  sorted.updatePixels();

//  image(sorted, 0, 0);
//}

//void mousePressed() {
//  String s = nf(second());
//  save(s + ".jpg");
//}
