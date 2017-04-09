game game_1;

void setup () {
  size (1400, 800);
  game_1 = new game ();

}


void draw () {
  game_1.run ();

}

void keyPressed () {
  if (game_1.state == "init") {
    if ((key == 'a') || (key == 'b') || (key == 'c') || (key == 'd')) {
      game_1.character = str (key);
    }
  }
  else if ((game_1.state == "play") && (key == 'p')) {
    game_1.state = "pause";
    game_1.clock.paused = true;
  }
  else if ((game_1.state == "pause") && (key == 'p')) {
    game_1.state = "play";
    game_1.clock.paused = false;
  }
  else if ((game_1.state == "over") && (key == 'q')) {
    game_1.state = "init";
    game_1.clock = new timer (millis (), 6);
  }
}