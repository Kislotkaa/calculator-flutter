abstract class Operation {
  final String operation;

  Operation(this.operation);
}

class Default extends Operation {
  Default() : super('');
}

class Plus extends Operation {
  Plus() : super('+');
}

class Minus extends Operation {
  Minus() : super('-');
}

class Multiplication extends Operation {
  Multiplication() : super('*');
}

class Division extends Operation {
  Division() : super('/');
}

class Pow extends Operation {
  Pow() : super('^');
}
