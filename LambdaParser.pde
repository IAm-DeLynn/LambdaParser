
void setup() {
  ArrayList<Token> tokens = tokenize("x y z #-.-#");
  
  printArray(tokens);
  
  Parser p = new Parser(tokens);
  Expr output = p.parse();
  
  println(output);
  
  System.exit(0);
}
