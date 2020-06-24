PImage img;
int mode = 2;

Particles[] par;

int cols;
int rows;
color[][] myArray;



void setup() {
  img = loadImage("photo.jpg");

  cols = img.width;
  rows = img.height;
  myArray = new color [cols][rows];

  // should be the same as a photo size
  size(684, 870);
  background(255);

  for (int gridX = 0; gridX < img.width; gridX += 1) {
    for (int gridY = 0; gridY < img.height; gridY += 1) {


      img.loadPixels();
      color c = color(img.get(gridX, gridY));
      color grey = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      myArray[gridX][gridY] = c;
    }
  }
  
  
   par = new Particles[600]; 
   
   for (int i = 0; i < par.length; i++){
     par[i] = new Particles();
   }
  
}

void draw(){
  for (Particles p : par){
   p.update();
   p.edges();
   p.show();
   
  }
  
}
