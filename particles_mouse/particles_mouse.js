var num = 1000;

var x = [];
var y = [];
var vx = [];
var vy = [];
var ax = [];
var ay = [];

//var mag = 100.0; 
var diameter = 2 ; 
var deacc = 0.95; 
var drawing = true;

function setup() {
  createCanvas(600, 600);
  noStroke(); 
  fill(0);
  background(0);
  blendMode(LIGHTEST);//SCREEN,add, lightest, exclusion;

  for (var i =0; i< num; i++) {
    x[i] = width / 2;
    y[i] = height / 2;
    vx[i] = 0;
    vy[i] = 0;
    ax[i] = 0;
    ay[i] = 0;
  }
}


function draw() {

  if (drawing) {

    for (var i = 0; i < num; i++) {

      var distance = dist(mouseX, mouseY, x[i], y[i]); 
      var mag = constrain(distance, 30, 100);

      ax[i] = mag * (mouseX - x[i]) / (distance * distance); 
      ay[i] = mag * (mouseY - y[i]) / (distance * distance);

      vx[i] += ax[i]; 
      vy[i] += ay[i];

      vx[i] = vx[i] * deacc;
      vy[i] = vy[i] * deacc;

      x[i] += vx[i] + random(-2, 2);  
      y[i] += vy[i] + random(-2, 2);

      if (x[i] > width - 10) x[i] = random(width / 2 - 20, width / 2 + 20);
      if (x[i] < 10) x[i] = random(width / 2 - 20, width / 2 + 20); 
      if (y[i] > height - 10) y[i] = random(height / 2 - 20, height / 2 + 20); 
      if (y[i] < 10) y[i] = random(height / 2 - 20, height / 2 + 20);

      fill(random(255), random(255), random(255), 100);

      ellipse(x[i], y[i], diameter, diameter);
    }
  }
}

function mousePressed() {
  if (drawing){
    drawing = false;
  }else{
    drawing = true;
  }
}
