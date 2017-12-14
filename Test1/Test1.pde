// somewhere to store the data
Table table;

// the total number of days
float numDays;
// the maximum steps from our data
float maxSteps = 0.0;

// these variables are used to control the amount of randomness we add. 
// Increasing the noiseScaleY or noiseScaleX values will make it look more jumpy
float noiseOffsetY = 0.0;
float noiseScaleY = 0.0012;

float noiseOffsetX = 0.0;
float noiseScaleX = 0.0013;

// setup the sketch
void setup() {
  // tell the sketch window how big it will be
  size(800, 450);
  // add the data to our table. Note: our data does have a header row
  table = loadTable("data.csv", "header");
  // user feedback : how many rows are in the table
  println(table.getRowCount() + " total rows in table"); 
  // assign the number of rows to our numDays variable
  numDays = table.getRowCount(); 
  // for each table row...
  for (TableRow row : table.rows()) {
    // temporarily store which day and how many steps you did
    int day = row.getInt("day");
    int steps = row.getInt("steps"); 
    // ask if today was the day you did the most steps so far?
    maxSteps = max(maxSteps, steps);
    // user feedback: how many steps did I do today
    println("On day", day, "your step count was", steps);
  }
  // drawing settings: no fill colour, a purple stroke and a white background
  noFill();
  stroke(188, 95, 247, 20);
  background(255);
}
// end setup()

// the part of the sketch that runs over and over
void draw() {
  // we need to update the noise offset values every frame, to make an interesting change
  noiseOffsetY += noiseScaleY;
  noiseOffsetX += noiseScaleX;
  // start drawing a shape on the screen
  beginShape();
  // for each table row...  
  for (TableRow row : table.rows()) {
    /// temporarily store how many steps you did for that day
    int day = row.getInt("day");
    int steps = row.getInt("steps"); 
    // the x position moves accross the window, but starts before 0
    float x = frameCount - 300;
    // the y position starts halfway down the window
    float y = height/2;
    // psuedo-randomly alter the x and y positions based on our noiseOffset values
    // note what happens if we comment these lines out. 
    // note what happens if we change the values of noiseScaleX and noiseScaleY
    y *= noise(noiseOffsetX);
    x *= noise(noiseOffsetX); 
    // update the position of each point in the shape
    // the x position is updated by sin of an angle, the day as a % of the total number of days, times 360 degrees
    // then we multiply it by the radius of a circle (100). What happens if you change this value?
    // and we multiply by the relative amount of steps (steps/maxSteps). What happens if we add a new noise value here?
    x += sin(radians(day/numDays * 360)) * 100 * steps/maxSteps;
    // do the same with Y, but use cos instead of sin of the angle.
    y += cos(radians(day/numDays * 360)) * 100 * steps/maxSteps;
    // add a point to the shape, and make it curvy instead of straight lines
    // ? what happens if you use vertex(x, y); instead of curveVertex(x, y); ? 
    curveVertex(x, y);
  }
  // end the shape and close the line to make a loop
  endShape(CLOSE);
}
// end of draw();