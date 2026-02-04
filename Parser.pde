
class Parser {
  ArrayList<Token> tokens;
  int pos;
  
  Parser(ArrayList<Token> _tokens) {
    tokens = _tokens;
    pos = 0;
  }
  
  Token currToken() {
    if(pos < 0 || pos > tokens.size() - 1) return new Token(TokenType.EOF);
    return tokens.get(pos);
  }
  
  void nextToken() {
    pos++;
  }
  
  Token consume(TokenType type) {
    if(currToken().type != type) throw new RuntimeException("Expected token " + type + " at pos token #" + pos + ", got " + currToken().type);
    
    Token token = currToken();
    
    nextToken();
    
    return token;
  }
  
  Expr parse() {
    Expr expr = parseExpr();
    
    consume(TokenType.EOF);
    
    return expr;
  }
  
  Expr parseExpr() {
    Expr expr = null;
    if(currToken().type == TokenType.KW_FN) {
      expr = parseLambda();
    } else {
      expr = parseAppl();
    }
    
    return expr;
  }
  
  Lambda parseLambda() {
    String id; 
    
    consume(TokenType.KW_FN);
    Token idToken = consume(TokenType.ID);
    
    id = idToken.parsedStr;
    
    consume(TokenType.FULL_STOP);
    
    Expr expr = parseExpr();
    
    return new Lambda(id, expr);
  }
  
  Expr parseAtom() {
    Expr expr = null;
    
    if(currToken().type == TokenType.LPAREN) {
      nextToken();
      expr = parseExpr();
      consume(TokenType.RPAREN);
    } else if(currToken().type == TokenType.ID) {
      expr = new Id(currToken().parsedStr);
      consume(TokenType.ID);
    } else throw new RuntimeException("Expected tokens ID, RPAREN at pos token #" + pos + ", got " + currToken().type);
    
    return expr;
  }
  
  Appl parseAppl() {
    Appl appl = new Appl(null);
    
    appl.expr1 = parseAtom();
    
    while(true) {
      try {
        appl = new Appl(appl, parseAtom());
      } catch(RuntimeException e) {
        break;
      }
    }
    
    return appl;
  }
}
