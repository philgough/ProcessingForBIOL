// somewhere to store the data
Table table;

// the total number of days
float numDays;
// the maximum steps from our data
float maxSteps = 0.0;

float denominator = 0.0;
float numerator = 0.0;
float average = 0.0;

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
    numerator += (float) steps;
    // ask if today was the day you did the most steps so far?
    maxSteps = max(maxSteps, steps);
    // user feedback: how many steps did I do today
    println("On day", day, "your step count was", steps);
  }
  
  denominator = (float) table.getRowCount();
  average = numerator/denominator;
  
  // drawing settings: no fill colour, a purple stroke and a white background
  noFill();
  background(255);
}
// end setup()

// the part of the sketch that runs over and over
void draw() {
  background(255);
  for (int i = 0; i < numDays; i++) {
    float x = map(i, 0, numDays, 10, width - 10);
    
    float y = height - map(table.getRow(i).getFloat("steps"), 0, maxSteps, 10, height-10);
  
    
    for (int j = height; j > y; j-=10) {
    
      fill(255);
    
      ellipse(x, j, 10, 10);
    
    }
  }
}
// end of draw();