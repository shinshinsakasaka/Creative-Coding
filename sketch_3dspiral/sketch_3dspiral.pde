int radius = 200;

float incS = 18;
float maxT = 180;
//float maxT = 360;

boolean drawing = true;

void setup() {  
  size(1000, 600, OPENGL);  
  background(255);  
  stroke(0);
}

void draw() {
  if (drawing) {
    background(255);
    translate(width/2, height/2);  
    rotateY(frameCount * 0.02);  
    //rotateX(frameCount * 0.01);

    incS += 0.2;
    if (incS >= 360) {
      incS = 18;
    }

    float s = 0;  
    float t = 0;  
    float lastx = 0;  
    float lasty = 0;  
    float lastz = 0;

    while (t < maxT) {    
      s += incS;    
      t += 1;    
      float radianS = radians(s);
      float radianT = radians(t);

      //float thisx = 0 + (radius * cos(radianS) * sin(radianT));    
      //float thisy = 0 + (radius * sin(radianS) * sin(radianT));    
      //float thisz = 0 + (radius * cos(radianT));

      //float thisx = 0 + (radius * sin(radianS) * cos(radianT));    
      //float thisy = 0 + (radius * sin(radianS) * sin(radianT));    
      //float thisz = 0 + (radius * cos(radianT));

      //float thisx = 0 + (radius * sin(radianS) * cos(radianT));    
      //float thisy = 0 + (radius * cos(radianS) * cos(radianT));    
      //float thisz = 0 + (radius * cos(radianT));

      float thisx = 0 + (radius * sin(radianT));    
      float thisy = 0 + (radius * sin(radianT) * cos(radianT) * sin(radianT));    
      float thisz = 0 + (radius * cos(radianS) * sin(radianS));

      if (lastx != 0) {      
        line(thisx, thisy, thisz, lastx, lasty, lastz);
      } 

      lastx = thisx;    
      lasty = thisy;    
      lastz = thisz;
    }
  }
}


void keyPressed() {
  if (drawing) {
    drawing = false;
  } else
  {
    drawing = true;
  }
}
