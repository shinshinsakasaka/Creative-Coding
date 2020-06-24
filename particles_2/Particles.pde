class Particles {
  PVector pos;
  PVector vel;

  Particles() {
    //pos = new PVector(random(width), random(height));
    pos = new PVector(width / 2, height / 2);
    vel = PVector.random2D();
    //vel = new PVector(random(-10, 10), random(-10, 10));
  }

  void update() {
    pos.add(vel);
  }

  void show() {
    int x = int(pos.x);
    int y = int(pos.y);

    switch(mode) {

    case 1:
      stroke(myArray[x][y]);
      point(pos.x, pos.y);
      break;
    
    case 2:
      fill(myArray[x][y]);
      noStroke();
      ellipse(pos.x, pos.y, 3, 3);
      break;
    }
  }

  void edges() {
    if (pos.x > width - 10) pos.x = 10;
    if (pos.x < 10) pos.x = width - 10; 
    if (pos.y > height - 10) pos.y = 10; 
    if (pos.y < 10) pos.y = height - 10;
  }
}
