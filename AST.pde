
interface Expr {}

class Appl implements Expr {
  Expr expr1, expr2;
  
  Appl(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    expr2 = _expr2;
  }
  
  Appl(Expr _expr1) {
    expr1 = _expr1;
    expr2 = null;
  }
  
  String toString() {
    return "APPL(" + expr1 + ", " + expr2 + ")";
  }
}

class Id implements Expr {
  String id;
  
  Id(String _id) {
    id = _id;
  }
  
  String toString() {
    return "ID(" + id + ")";
  }
}

class Lambda implements Expr {
  String id;
  Expr expr;
  
  Lambda(String _id, Expr _expr) {
    id = _id;
    expr = _expr;
  }
  
  String toString() {
    return "LAMBDA(" + id + ", " + expr + ")";
  }
}
