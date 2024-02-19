//Chapter 5
void main() {

}

class Singleton {
  static Singleton? uniqueInstance;

  Singleton._();

  static Singleton getInstance() {
    if (uniqueInstance == null) {
      uniqueInstance = Singleton._();
    }
    return uniqueInstance!;
  }
}

class ChocolateBoiler {
  bool empty = true;
  bool boiled = false;
  
  static ChocolateBoiler? uniqueInstance;
  
  ChocolateBoiler() {
    empty = true;
    boiled = false;
  }

  static ChocolateBoiler? getInstance() {
    if (uniqueInstance == null) {
      uniqueInstance = new ChocolateBoiler();
    }
    uniqueInstance = ChocolateBoiler();
  
    return uniqueInstance;
  }

  void fill() {
    
    if (isEmpty()) {
      empty = false;
      boiled = false;
    }
  }

  void drain() {
    if (!isEmpty() && isBoiler()) {
      empty = true;
    }
  }

  void boil() {
    if (!isEmpty() && !isBoiler()) {
      boiled = true; 
    }
  }

  bool isEmpty() {
    return empty;
  }

  bool isBoiler() {
    return boiled;
  }
}
