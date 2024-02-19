//Chapter 3
void main() {
}

enum Size {
  LOW,
  MEDIUM,
  HIGH,
}


abstract class Beverage {
  String description = 'Unknown Beverage';

  double cost();

  String getDescription() {
    return description;
  }
  
  getSize() {}
}

abstract class Cost {
  void cost();
}

abstract class Description {
  void getDescription();
}

class DarkRoast extends Beverage {
  DarkRoast() {
    description = 'Most Excellent Dart Roast';
    
  }
  double cost() {
    return .99;
  }
}

class HouseBlend extends Beverage {
  HouseBlend() {
    description = 'House Blend Coffee';
  }

  double cost() {
    return .89;
  }
}

class Espresso extends Beverage {
  Espresso() {
    description = 'Espresso';
  }

  double cost() {
    return 1.99;
  }
}

class Decaf extends Beverage {
  Decaf() {
    description = 'Decaf';
  }

  double cost() {
    return 1.05;
  }
}

class CondimentDecorator extends Beverage {

  late Beverage beverage;
  
  String getDescription() {
    return '';
  }
  
  @override
  double cost() {
    throw UnimplementedError();
  }
  
  getSize() {
    return beverage.getSize();
  }

}

class SteamdMilk extends CondimentDecorator {
  SteamdMilk(Beverage beverage) {
    this.beverage = beverage;
  }

  String getDescription() {
    return beverage.getDescription() + ", Milk";
  }

  double cost() {
    return beverage.cost() + .10;
  }
}

class Mocha extends CondimentDecorator {
  Mocha(Beverage beverage) {
    this.beverage = beverage;
  }

  String getDescription() {
    return beverage.getDescription() + ", Mocha";
  }

  double cost() {
    return beverage.cost() + .20;
  }
}



class Soy extends CondimentDecorator {
  Soy(Beverage beverage) {
    this.beverage = beverage;
  }

  String getDescription() {
    return beverage.getDescription() + ", Soy";
  }

  double cost() {
    double cost = beverage.cost();
    switch (beverage.getSize()) {
      case Size.LOW:
        cost += 0.10;
        break;
      case Size.MEDIUM:
        cost += 0.15;
        break;
      case Size.HIGH:
        cost += 0.20;
        break;
      default:
        break;
    }
    return cost;
  }
}


class Whip extends CondimentDecorator {
  Whip(Beverage beverage) {
    this.beverage = beverage;
  }

  String getDescription() {
    return beverage.getDescription() + ", Whip";
  }

  double cost() {
    return beverage.cost() + .10;
  }
}


//-----------------------------
void main2() {

  Beverage beverage = new Espresso();
  print(beverage.getDescription() +" \$ " + "${beverage.cost()}");

  Beverage beverage2 = new DarkRoast();
  beverage2 = new Mocha(beverage2);
  beverage2 = new Mocha(beverage2);
  beverage2 = new Whip(beverage2);
  print(beverage2.getDescription() + " \$" + "${beverage2.cost()}");

  Beverage beverage3 = new HouseBlend();
  beverage3 = new Soy(beverage3);
  beverage3 = new Mocha(beverage3);
  beverage3 = new Whip(beverage3);
  print(beverage3.getDescription() + " \$" + "${beverage3.cost()}");

}