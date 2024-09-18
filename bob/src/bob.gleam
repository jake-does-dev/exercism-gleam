import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed = string.trim(remark)
  let is_silence = string.is_empty(trimmed)
  let is_question = string.ends_with(trimmed, "?")
  let is_yelling =
    trimmed == string.uppercase(trimmed) && trimmed != string.lowercase(trimmed)

  case is_silence, is_question, is_yelling {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, False -> "Sure."
    _, False, True -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}
