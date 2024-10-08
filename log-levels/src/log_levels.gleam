import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> message -> message
    "[WARNING]: " <> message -> message
    "[ERROR]: " <> message -> message
    _ -> log_line
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[WARNING]: " <> _message -> "warning"
    "[ERROR]: " <> _message -> "error"
    _ -> "info"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
