//Photo by Anastasia Vityukova on Unsplash


var img;
var cl = [];
var tileWidth;
var tileHeight;

var particles = [];

function preload() {
  img = loadImage('pic1.jpg');
}

function setup() {
  //createCanvas(473, 303);
  createCanvas(303, 473);
  
  for (var gridX = 0; gridX <= img.width; gridX++) {
    cl[gridX] = [];
    for (var gridY = 0; gridY <= img.height; gridY++) {

      tileWidth = width / img.width;
      tileHeight = height / img.height;

      img.loadPixels();
      var c = color(img.get(gridX, gridY));

      cl[gridX][gridY] = c;
    }
  }
  
  for (var i = 0; i < 500; i++){
  particles[i] = new Particle();
  }
}


function draw() {
  for (var i = 0; i < particles.length; i++){
   particles[i].update();
   particles[i].edges();
   particles[i].show();
   
  }
}
