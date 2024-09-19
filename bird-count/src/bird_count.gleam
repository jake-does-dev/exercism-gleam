import gleam/list

pub fn today(days: List(Int)) -> Int {
  case list.first(days) {
    Ok(today) -> today
    Error(_) -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [_, ..rest] -> [today(days) + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [first, ..] if first == 0 -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] -> first + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] if first < 5 -> 0 + busy_days(rest)
    [_, ..rest] -> 1 + busy_days(rest)
  }
}
