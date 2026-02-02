
class Token {
  TokenType type;
  String parsedStr = "";
  
  Token(TokenType _type) {
    type = _type;
    parsedStr = "";
  }
  
  Token(String _parsedStr) {
    parsedStr = _parsedStr;
  }
  
  Token(TokenType _type, String _parsedStr) {
    type = _type;
    parsedStr = _parsedStr;
  }
  
  String toString() {
    return type + "(" + parsedStr + ")";
  }
}
