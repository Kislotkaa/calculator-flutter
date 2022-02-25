abstract class Operation {
  final String operation;

  Operation(this.operation);
}

class Plus extends Operation {
  Plus() : super('+');
}

class Default extends Operation {
  Default() : super('');
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
