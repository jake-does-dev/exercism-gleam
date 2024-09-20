import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let good_trade = !set.contains(collection, their_card)
  let have_mine = set.contains(collection, my_card)

  let new_collection =
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)

  #(good_trade && have_mine, new_collection)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  let first = case list.first(collections) {
    Ok(value) -> value
    Error(_) -> set.new()
  }

  collections
  |> list.fold(first, fn(x, y) { set.intersection(x, y) })
  |> set.to_list
  |> list.sort(by: string.compare)
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  let first = case list.first(collections) {
    Ok(value) -> value
    Error(_) -> set.new()
  }

  collections
  |> list.fold(first, fn(x, y) { set.union(x, y) })
  |> set.to_list
  |> list.length
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(x) { string.starts_with(x, "Shiny ") })
}
