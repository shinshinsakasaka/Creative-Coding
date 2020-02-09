function Particle() {
  this.pos = createVector(width * 0.5 - 40, height / 2);
  this.vel = p5.Vector.random2D();

  this.update = function() {
    this.vel.add(random(-0.5, 0.5), random(-0.5, 0.5));
    //this.vel.x = random(-6, 6);
    //this.vel.y = random(-6, 6);
    this.pos.add(this.vel);
  }


  this.show = function() {
    var gridx = int(this.pos.x / tileWidth);
    var gridy = int(this.pos.y / tileHeight);
    

    stroke(cl[gridx][gridy]);
    point(this.pos.x, this.pos.y);
  }

  this.edges = function() {
    if (this.pos.x > width - 10) this.pos.x = 10;
    if (this.pos.x < 10) this.pos.x = width - 10; 
    if (this.pos.y > height - 10) this.pos.y = 10; 
    if (this.pos.y < 10) this.pos.y = height - 10;
  }
}
