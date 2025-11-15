enum TerritoryStatus {
  idle, // before starting
  recording, // tracking in progress
  paused, // user paused capture
  finished, // capture completed
  discarded, // capture cancelled
}
