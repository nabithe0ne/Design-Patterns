//Chapter 4
void main() {}

abstract class Pizza {
  late Dough dough;
  late Sauce sauce;
  late List<Veggie> veggies;
  late Cheese cheese;
  late Pepperoni pepperoni;
  late Clams clam;

  late String name;
  List<String> toppings = <String>[];

  void prepare() {
    print('Preparing ' + name);
    print('Tossing dough...');
    print('Adding sauce..');
    print('Adding toppings: ');
    for (String topping in toppings) {
      print(' ' + topping);
    }
  }

  void bake() {
    print('Bake for 25 minutes at 350');
  }

  void cut() {
    print('Cutting the pizza into diagonal slices');
  }

  void box() {
    print('Place pizza in offical PizzaStore box');
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }
}

class PizzaStore {
  late PizzaIngredientFactory ingredientFactory;
  // late SimplePizzaFactory factory;

  Pizza orderPizza(String type) {
    late Pizza pizza;

    if (type == ("cheese")) {
      pizza = new CheesePizza(ingredientFactory);
    } else if (type == ("pepperoni")) {
      pizza = new PepperoniPizza(ingredientFactory);
    } else if (type == ("Clam")) {
      pizza = new ClamPizza(ingredientFactory);
    } else if (type == ("veggie")) {
      pizza = new VeggiePizza(ingredientFactory);
    }

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }

  Pizza createPizza(String type) {
    throw UnimplementedError();
  }

  // PizzaStore(SimplePizzaFactory factory) {
  //   this.factory = factory;
  // }
}

// class SimplePizzaFactory {
//   late PizzaIngredientFactory ingredientFactory;
//   Pizza createPizza(String type) {
//     late Pizza pizza;
//     if (type == "cheese") {
//       pizza = new CheesePizza(ingredientFactory);
//     } else if (type == ("pepperoni")) {
//       pizza = new PepperoniPizza(ingredientFactory);
//     } else if (type == "clam") {
//       pizza = new ClamPizza(ingredientFactory);
//     } else if (type == "veggie") {
//       pizza = new VeggiePizza(ingredientFactory);
//     }
//     return pizza;
//   }
// }

class NYStyleCheesePizza extends Pizza {
  NYStyleCheesePizza() {
    name = 'NY Style Sauce and Cheese Pizza';
    toppings.add('Grated Reggiano Cheese');
  }
}

class ChicagoStyleCheesePizza extends Pizza {
  void cut() {
    print('Cutting the pizza into square slices');
  }
}

class ChicagoStylePepperoniPizza extends Pizza {}

class ChicagoStyleClamPizza extends Pizza {}

class ChicagoStyleVeggiePizza extends Pizza {}

class DependentPizzaStore {
  Pizza createPizza(String style, String type) {
    late Pizza pizza;
    if (style == 'NY') {
      if (type == 'cheese') {
        pizza = new NYStyleCheesePizza();
      } else if (type == 'veggie') {
        pizza = new NYStyleVeggiePizza();
      } else if (type == 'clam') {
        pizza = new NYStyleClamPizza();
      } else if (type == 'pepperoni') {
        pizza = new NYStylePepperoniPizza();
      }
    } else if (type == 'Chicago') {
      if (type == 'cheese') {
        pizza = new ChicagoStyleCheesePizza();
      } else if (type == 'veggie') {
        pizza = new ChicagoStyleVeggiePizza();
      } else if (type == 'clam') {
        pizza = new ChicagoStyleClamPizza();
      } else if (type == 'pepperoni') {
        pizza = new ChicagoStylePepperoniPizza();
      }
    } else {
      print('Error: invalid type of pizza');
    }
    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }
}

class NYStylePepperoniPizza extends Pizza  {
}

class NYStyleClamPizza extends Pizza {
}

class NYStyleVeggiePizza extends Pizza {}

abstract class PizzaIngredientFactory {
  Dough createDough();
  Sauce createSauce();
  Cheese creatCheese();
  List<Veggie> createVeggie();
  Pepperoni createPepperoni();
  Clams createClam();
}

class Clams {}

class Pepperoni {}

class Veggie {}

class Cheese {}

class Sauce {}

class Dough {}

class NYPizzaIngredientFactory implements PizzaIngredientFactory {
  @override
  Cheese creatCheese() {
    return new ReggianoChees();
  }

  @override
  Clams createClam() {
    return new FreshClams();
  }

  @override
  Dough createDough() {
    return new ThinCrustDough();
  }

  @override
  Pepperoni createPepperoni() {
    return new SlicedPepperoni();
  }

  @override
  Sauce createSauce() {
    return new MarinaraSauce();
  }

  @override
  List<Veggie> createVeggie() {
    List<Veggie> veggies = [Garlic(), Onion(), MushRoom(), RedPepper()];
    return veggies;
  }
}

class RedPepper extends Veggie {}

class MushRoom extends Veggie {}

class Onion extends Veggie {}

class Garlic extends Veggie {}

class MarinaraSauce implements Sauce {}

class SlicedPepperoni implements Pepperoni {}

class FreshClams implements Clams {}

class ReggianoChees implements Cheese {}

class ThinCrustDough implements Dough {}

class CheesePizza extends Pizza {
  late PizzaIngredientFactory ingredientFactory;

  CheesePizza(PizzaIngredientFactory ingredientFactory) {
    this.ingredientFactory = ingredientFactory;
  }

  void prepare() {
    print('Preparing ' + name);
    dough = ingredientFactory.createDough();
    sauce = ingredientFactory.createSauce();
    cheese = ingredientFactory.creatCheese();
  }
}

class ClamPizza extends Pizza {
  late PizzaIngredientFactory ingredientFactory;

  ClamPizza(PizzaIngredientFactory ingredientFactory) {
    this.ingredientFactory = ingredientFactory;
  }

  void prepare() {
    print('Preparing ' + name);
    dough = ingredientFactory.createDough();
    sauce = ingredientFactory.createSauce();
    cheese = ingredientFactory.creatCheese();
    clam = ingredientFactory.createClam();
  }
}

class VeggiePizza extends Pizza {
  late PizzaIngredientFactory ingredientFactory;

  VeggiePizza(PizzaIngredientFactory ingredientFactory) {
    this.ingredientFactory = ingredientFactory;
  }

  void prepare() {
    print('Preparing ' + name);
    dough = ingredientFactory.createDough();
    sauce = ingredientFactory.createSauce();
    cheese = ingredientFactory.creatCheese();
    veggies = ingredientFactory.createVeggie();
  }
}

class PepperoniPizza extends Pizza {
  late PizzaIngredientFactory ingredientFactory;

  PepperoniPizza(PizzaIngredientFactory ingredientFactory) {
    this.ingredientFactory = ingredientFactory;
  }

  void prepare() {
    print('Preparing ' + name);
    dough = ingredientFactory.createDough();
    sauce = ingredientFactory.createSauce();
    cheese = ingredientFactory.creatCheese();
    pepperoni = ingredientFactory.createPepperoni();
  }
}

class NYPizzaStore extends PizzaStore {
  late Pizza pizza;
  PizzaIngredientFactory ingredientFactory = new NYPizzaIngredientFactory();

  @override
  Pizza createPizza(String item) {
    if (item == 'cheese') {
      pizza = new CheesePizza(ingredientFactory);
      pizza.setName('New York Style Chees Pizza');
    } else if (item == 'veggie') {
      pizza = new VeggiePizza(ingredientFactory);
      pizza.setName('New York Style Veggie Pizza');
    } else if (item == 'clam') {
      pizza = new ClamPizza(ingredientFactory);
      pizza.setName('New York Style Clam Pizza');
    } else if (item == 'pepperoni') {
      pizza = new PepperoniPizza(ingredientFactory);
      pizza.setName('New York Stle Pepperono Pizza');
    }
    return pizza;
  }
}


class ChicagoPizzaStore extends PizzaStore {
  late Pizza pizza;

  @override
  Pizza createPizza(String item) {
    if (item == 'cheese') {
      return new ChicagoStyleCheesePizza();
    } else if (item == 'veggie') {
      return new ChicagoStyleVeggiePizza();
    } else if (item == 'clam') {
      return new ChicagoStyleClamPizza();
    } else if (item == 'pepperoni') {
      return new ChicagoStylePepperoniPizza();
    }
    return pizza;
  }
}
