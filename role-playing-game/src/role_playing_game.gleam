import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    _ -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  let #(revive_health, revive_mana) = case player.level >= 10 {
    True -> #(100, Some(100))
    False -> #(100, player.mana)
  }

  case player.health {
    0 -> Some(Player(..player, health: revive_health, mana: revive_mana))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(Player(..player, mana: Some(mana - cost)), 2 * cost)
    Some(_) -> #(player, 0)
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
  }
}
