import gleam/result

pub fn with_retry(experiment: fn() -> Result(t, e)) -> Result(t, e) {
  case experiment() {
    Error(_) -> experiment()
    Ok(val) -> Ok(val)
  }
}

pub fn record_timing(
  time_logger: fn() -> Nil,
  experiment: fn() -> Result(t, e),
) -> Result(t, e) {
  time_logger()
  let result = experiment()
  time_logger()
  result
}

pub fn run_experiment(
  name: String,
  setup: fn() -> Result(t, e),
  action: fn(t) -> Result(u, e),
  record: fn(t, u) -> Result(v, e),
) -> Result(#(String, v), e) {
  use setup <- result.try(setup())
  use action <- result.try(action(setup))
  use record <- result.try(record(setup, action))
  Ok(#(name, record))
}
