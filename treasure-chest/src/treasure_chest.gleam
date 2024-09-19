pub type TreasureChest(a) {
  TreasureChest(
    password: String,
    treasure: a
  )
}

pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(chest_password, treasure) if chest_password == password -> Unlocked(treasure)
    _ -> WrongPassword
  }
}
