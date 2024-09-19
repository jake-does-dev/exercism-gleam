import gleam/float
import gleam/list
import gleam/order.{type Order, Eq, Gt, Lt}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(c1), Celsius(c2) -> float.compare(c1, c2)
    Celsius(c), Fahrenheit(f) -> float.compare(c, fahrenheit_to_celsius(f))
    Fahrenheit(f), Celsius(c) -> float.compare(fahrenheit_to_celsius(f), c)
    Fahrenheit(f1), Fahrenheit(f2) ->
      float.compare(fahrenheit_to_celsius(f1), fahrenheit_to_celsius(f2))
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(by: fn(left, right) {
    compare_temperature(left.temperature, right.temperature)
  })
}
