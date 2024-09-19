import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  compute_pizza_price(pizza, 0)
}

fn compute_pizza_price(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(p) -> {
      let acc = acc + 1
      compute_pizza_price(p, acc)
    }
    ExtraToppings(p) -> {
      let acc = acc + 2
      compute_pizza_price(p, acc)
    }
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let size_fee = case list.length(order) {
    0 -> 0
    1 -> 3
    2 -> 2
    _ -> 0
  }

  compute_order_price(order, size_fee)
}

fn compute_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [pizza, ..rest] -> {
      let acc = acc + pizza_price(pizza)
      compute_order_price(rest, acc)
    }
  }
}
