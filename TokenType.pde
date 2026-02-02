
enum TokenType {
  BLOCK_ANNOTATION("\\#\\-.*?\\-\\#", true),
  LINE_ANNOTATION("\\#.*?$", true),
  
  WHITESPACE("\\s+", true),
  
  ID("((?!(fn|let)\\b))[a-zA-Z_][a-zA-Z_0-9]*"),
  
  KW_FN("fn"),
  
  FULL_STOP("\\."),
  LPAREN("\\("), RPAREN("\\)"),
  
  EOF();
  
  String regex;
  boolean hasToBeIgnored = false;
  
  TokenType() {
    regex = null;
    hasToBeIgnored = false;
  }
  
  TokenType(String re) {
    regex = re;
    hasToBeIgnored = false;
  }
  
  TokenType(String re, boolean _hasToBeIgnored) {
    regex = re;
    hasToBeIgnored = _hasToBeIgnored;
  }
}
