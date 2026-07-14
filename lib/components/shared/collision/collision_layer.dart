/// Defines the different collision layers for filtering interactions.
/// 
/// Used to determine which objects can collide with each other
/// (e.g., Player only collides with Enemy attacks).
enum CollisionLayer {
  player,
  enemy,
  environment,
  playerAttack,
  enemyAttack,
}
