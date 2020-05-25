//Photo by Omid Armin on Unsplash

PImage img;

int mode = 1;

float len = 3;
int xSign = 1;
int ySign = 1;
String str = "Hello World";
int counter = 0;

void setup() {
  img = loadImage("photo.jpg");


  size(684, 776);
  textAlign(CENTER);
}

void draw() {
  background(255);
  int tileWidth = width / img.width;
  int tileHeight = height / img.height;
  for (int gridX = 0; gridX < img.width; gridX += 1) {
    for (int gridY = 0; gridY < img.height; gridY += 1) {


      int posX = tileWidth * gridX;
      int posY = tileHeight * gridY;


      img.loadPixels();
      color c = color(img.get(gridX, gridY));
      color grey = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      switch(mode) {
      case 1://ellipse
        float radius = map(grey, 0, 255, 10, 1);
        if (mouseX > width / 2) radius = map(grey, 0, 255, 1, 10);
        fill(0);
        ellipse(posX, posY, radius, radius);
        break;
      case 2://line
        float weight = map(grey, 0, 255, 8, 0.5);
        strokeWeight(weight);
        line(posX, posY, posX + len * xSign, posY + len * ySign);
        break;
      case 3://triangle
        float wh = map(grey, 0, 255, 7, 1);
        fill(0);//grey
        if (mouseX > width / 2) noFill();
        rectMode(CENTER);
        rect(posX, posY, wh, wh);
        break;
      case 4://arc
        float angle = map(grey, 0, 255, TWO_PI, 0);
        fill(0);
        arc(posX, posY, 8, 8, 0, angle);
        break;
      case 5://alpha
        float alpha = map(grey, 0, 255, 255, 0);
        if (mouseX > width / 2) alpha = grey;
        fill(0, alpha);
        ellipse(posX, posY, 8, 8);
        break;
      case 6://vertex
        float len = map(grey, 0, 255, 7, 0);
        fill(0);
        beginShape();
        vertex(posX, posY);
        vertex(posX + len / 2, posY + len / 2);
        vertex(posX + len, posY);
        vertex(posX + len, posY - len / 2);
        vertex(posX + len / 2, posY - len);
        vertex(posX, posY - len / 2);
        endShape(CLOSE);
        break;
      case 7://character
        float text = map(grey, 0, 255, 30, 0);
        fill(0);
        textSize(text);
        text(key, posX, posY);
        break;
      case 8://string
        pushMatrix();
        translate(posX, posY);
        float fontSize = map(grey, 0, 255, 20, 1);
        textSize(fontSize);
        char letter = str.charAt(counter);
        fill(0);
        if (mouseX > width / 2) fill(c);
        text(letter, 0, 0);
        popMatrix();
        counter++;
        if (counter >= str.length()) counter = 0;
        //noLoop();
        break;
      case 9:
        float range = 5;
        int number = int(map(grey, 0, 255, 100, 1));
        for (int i = 0; i < number; i++) {
          float x = random(posX - range, posX + range);
          float y = random(posY - range, posY + range);
          point(x, y);
        }
        noLoop();
        break;
      case 10:
        float weight2 = map(grey, 0, 255, 3, 0.1);
        strokeWeight(weight2);
        noFill();
        ellipse(posX, posY, 5, 5);
        break;
      }
    }
  }
}

void keyPressed() {
  if (key == '1') {
    mode = 1;
    println("current mode : 1");
    println();
  }
  if (key == '2') {
    mode = 2;
    len = int(random(1, 6));
    xSign = int(random(-2, 2));
    ySign = int(random(-2, 2));
    println("current mode : 2, length : " + len + ", xSign, ySign " + xSign, ySign);
    println();
  }
  if (key == '3') {
    mode = 3;
    println("current mode : 3");
    println();
  }
  if (key == '4') {
    mode = 4;
    println("current mode : 4");
    println();
  }
  if (key == '5') {
    mode = 5;
    println("current mode : 5");
    println();
  }
  if (key == '6') {
    mode = 6;
    println("current mode : 6");
    println();
  }
  if (key == '7') {
    mode = 7;
    println("current mode : 7");
    println();
  }
  if (key == '8') {
    mode = 8;
    println("current mode : 8");
    println();
  }
  if (key == '9') {
    mode = 9;
    println("current mode : 9");
    println();
  }
}
