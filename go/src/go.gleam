import gleam/string

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let rules_applied_game =
    game
    |> apply_rule(rule1)
    |> rule2
    |> apply_rule(rule3)
    |> apply_rule(rule4)

  case string.is_empty(rules_applied_game.error) {
    False -> Game(..game, error: rules_applied_game.error)
    True ->
      case game.player {
        Black -> Game(..rules_applied_game, player: White)
        White -> Game(..rules_applied_game, player: Black)
      }
  }
}

fn apply_rule(game: Game, rule: fn(Game) -> Result(Game, String)) -> Game {
  case rule(game) {
    Ok(changed) -> changed
    Error(err) -> Game(..game, error: err)
  }
}
