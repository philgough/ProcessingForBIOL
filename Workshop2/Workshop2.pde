size(300, 300);
background(255);
strokeWeight(2);
stroke(0);
noFill();
beginShape();
curveVertex(20, 20);
curveVertex(20, 20);
curveVertex(20, 40);
curveVertex(40, 40);
curveVertex(40, 20);
curveVertex(20, 20);
curveVertex(20, 20);
endShape();

strokeWeight(7);
stroke(255, 0, 0);
point(20, 20);
stroke(255, 255, 0);
point(20, 40);
stroke(0, 255, 0);
point(40, 40);
stroke(0, 255, 255);
point(40, 20);


strokeWeight(1);

float numPoints = 40;

beginShape();
for (float i = 0.0 ; i < numPoints; i++) {
  float y = 50.0;
  float x = 200.0;

  float degrees = i/numPoints * 360.0;
  float offset = 40.0;
  float x1 = x + offset * sin(radians(degrees));
  
  float y1 = y + offset * cos(radians(degrees));
  strokeWeight(1);
  stroke(0);
  line(x, y, x1,y1);
  stroke(0, 0, 255);
  strokeWeight(3);
  vertex(x1, y1);
  
}
endShape(CLOSE);

stroke(255, 0, 255);
beginShape();
curveVertex(200 + sin(0) * 40, 200 + cos(0) * 40);

for (float i = 0.0 ; i < numPoints; i++) {
  float y = 200.0;
  float x = 200.0;

  float degrees = i/numPoints * 360.0;
  float offset = 40.0;
  float x1 = x + offset * sin(radians(degrees));
  
  float y1 = y + offset * cos(radians(degrees));
  strokeWeight(1);
  stroke(0);
  line(x, y, x1,y1);
  stroke(255, 0, 255);
  strokeWeight(3);
  curveVertex(x1, y1);
  
  
}
curveVertex(200 + sin(0) * 40, 200 + cos(0) * 40);
curveVertex(200 + sin(0) * 40, 200 + cos(0) * 40);

endShape();