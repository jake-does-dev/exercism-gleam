import gleam/queue.{type Queue}

pub fn insert_top(queue: Queue(Int), card: Int) -> Queue(Int) {
  queue
  |> queue.push_back(card)
}

pub fn insert_bottom(queue: Queue(Int), card: Int) -> Queue(Int) {
  queue
  |> queue.push_front(card)
}

pub fn remove_top_card(queue: Queue(Int)) -> Queue(Int) {
  remove_card(queue, queue.pop_back)
}

pub fn remove_bottom_card(queue: Queue(Int)) -> Queue(Int) {
  remove_card(queue, queue.pop_front)
}

fn remove_card(
  queue: Queue(Int),
  card_popper: fn(Queue(Int)) -> Result(#(Int, Queue(Int)), Nil),
) -> Queue(Int) {
  case card_popper(queue) {
    Error(_) -> queue
    Ok(#(_popped_elem, popped_queue)) -> popped_queue
  }
}

pub fn check_size_of_stack(queue: Queue(Int), target: Int) -> Bool {
  queue
  |> queue.length()
  == target
}
