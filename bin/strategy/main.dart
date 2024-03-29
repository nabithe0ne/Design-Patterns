void main() { 
}

abstract class Duck {
  late QuackBehavior quackBehavior;
  late FlyBehavior flyBehavior;

  Duck();

  void swim() {
    print('All ducks float, even decoys!');
  }
  
  void display();

  void performQuack() {
    quackBehavior.quack();
  }

  void performFly() {
    flyBehavior.fly();
  }

  void setFlyBehavior(FlyBehavior fBehavior) {
    flyBehavior = fBehavior;
  }

  void setQuackBehavior(QuackBehavior qBehavior) {
    quackBehavior = qBehavior;  
  }
}

abstract class QuackBehavior {
  void quack();
}

abstract class FlyBehavior {
  void fly();
}

class MallardDuck extends Duck {
  MallardDuck() {
    quackBehavior = new Quack();
    flyBehavior = new FlyWithWings();
  }

  void display() {
    print("I'm a real Mallard duck");
  }
}

class RedHeadDuck extends Duck {
  RedHeadDuck() {
    quackBehavior = new Quack();
    flyBehavior = new FlyWithWings();
  }

  @override
  void display() {
    print("I'm a real Red Head duck");
  }

}

class RubberDuck extends Duck {
  RubberDuck() {
     quackBehavior = new Quack();
  }

  @override
  void display() {
    print("I'm a real Rubber duck");
  }
}

class DecoyDuck extends Duck {

  @override
  void display() {
    print("I'm a real Decoy Duck");
  }
}

class FlyWithWings implements FlyBehavior {
  @override
  void fly() {
    print('implements duck flying');
  }
}

class FlyNoWay implements FlyBehavior {
  @override
  void fly() {
    print("do nothing - can't fly");
  }
}

class Quack implements QuackBehavior {
  @override
  void quack() {
    print('implements duck quacking');
  }
}

class Squeak implements QuackBehavior {
  @override
  void quack() {
    print('rubber duckie squeak');
  }
}

class MuteQuack implements QuackBehavior {
  @override
  void quack() {
    print("do nothing - can't speak");
  }

}

class MiniDuckSimulator {
  static void main() {
    Duck mallard = new MallardDuck();
    mallard.performQuack();
    mallard.performFly();

    Duck model = new ModelDuck();
    model.performFly();
    model.setFlyBehavior(new FlyRocketPowered());
    model.performFly();
  }
}

class ModelDuck extends Duck {
  ModelDuck();

  @override
  void display() {
    print("I'm a model duck");
  }
}

class FlyRocketPowered implements FlyBehavior {
  @override
  void fly() {
    print("I'm flying with a rocket!");
  }
}
