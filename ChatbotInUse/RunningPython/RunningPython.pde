

void setup() {
  int success = runPythonScript("test.py", "one two three");
  println(success);
  
}

void draw() {
  background(0);
}
