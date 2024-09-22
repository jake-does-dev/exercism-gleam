@external(erlang, "gb_trees", "empty")
fn gb_trees_empty() -> GbTree(k, v)

@external(erlang, "gb_trees", "insert")
fn gb_trees_insert(key: k, value: v, gb_tree: GbTree(k, v)) -> GbTree(k, v)

@external(erlang, "gb_trees", "delete_any")
fn gb_trees_delete_any(key: k, gb_tree: GbTree(k, v)) -> GbTree(k, v)

pub type GbTree(k, v)

pub fn new_gb_tree() -> GbTree(k, v) {
  gb_trees_empty()
}

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
  gb_trees_insert(key, value, tree)
}

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
  gb_trees_delete_any(key, tree)
}
