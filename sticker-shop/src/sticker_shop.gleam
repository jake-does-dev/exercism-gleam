import gleam/int
import gleam/list

pub type Usd

pub type Eur

pub type Jpy

pub opaque type Money(ccy) {
  Money(amount: Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
  Money(amount)
}

pub fn euro(amount: Int) -> Money(Eur) {
  Money(amount)
}

pub fn yen(amount: Int) -> Money(Jpy) {
  Money(amount)
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  prices
  |> list.map(fn(p) { p.amount })
  |> list.fold(0, int.add)
  |> Money
}
