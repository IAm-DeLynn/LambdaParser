
final boolean skipIgnorableTokens = true;

ArrayList<Token> tokenize(String input) {
  ArrayList<Token> output = new ArrayList<>();
  
  while(input != "") {
    String[] matched = {};
    
    int tokenPos = 0;
    boolean isMatchFound = false;
    
    for(TokenType type : TokenType.values()) {
      if(type == TokenType.EOF) continue;
      
      matched = match(input, "\\A" + type.regex);
      
      if(matched == null) continue;
      
      isMatchFound = true;
      
      if(!(type.hasToBeIgnored && skipIgnorableTokens)) output.add(new Token(type, matched[0]));
      input = input.substring(matched[0].length());
      tokenPos += matched[0].length();
      break;
    }
    
    if(!isMatchFound) throw new RuntimeException("Cannot tokenize '" + input + "' at " + tokenPos);
  }
  
  output.add(new Token(TokenType.EOF));
  
  return output;
}
