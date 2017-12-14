Table table;

float numDays;
float maxSteps = 0.0;

float noiseOffsetY = 0.0;
float noiseScaleY = 0.0012;

float noiseOffsetX = 0.0;
float noiseScaleX = 0.0013;

void setup() {
  
  size(800, 450);
  
  table = loadTable("data.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  numDays = table.getRowCount(); 

  for (TableRow row : table.rows()) {
    
    int day = row.getInt("day");
    int steps = row.getInt("steps"); 
    
    maxSteps = max(maxSteps, steps);
    
    println("On day", day, "your step count was", steps);
  }
  
  noFill();
  stroke(188, 95, 247, 20);
  background(255);
  
  
}

void draw() {
  noiseOffsetY += noiseScaleY;
  noiseOffsetX += noiseScaleX;
  beginShape();
  for (TableRow row : table.rows()) {
    
    int day = row.getInt("day");
    int steps = row.getInt("steps"); 
    
    float x = frameCount - 300;
    float y = height/2;
    
    y *= noise(noiseOffsetX);
    x *= noise(noiseOffsetX); 
            
    x += sin(radians(day/numDays * 360)) * 100 * steps/maxSteps;
    y += cos(radians(day/numDays * 360)) * 100 * steps/maxSteps;
    

    
    curveVertex(x, y);
    
  }
  
  endShape(CLOSE);
}