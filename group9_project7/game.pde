class game {

  String state;
  String character;
  timer clock;
  score player_score;
  game () {
    state = "init";
    character = "none";
    player_score = new score (300, 60, 50);
    clock = new timer (0, 6);
  }
  
  
  void run () {
    if (this.state == "init") {
      this.display_init ();  
    
    }
    else if (this.state == "play") {
       this.display_play (); 
    }
    else if (this.state == "pause") {
      this.display_paused ();
    }
    else if (this.state == "over") {
      this.display_over ();
    }
  }
  
  
  void display_init () {
    if (this.character == "none") {
      background (0);
      textAlign (CENTER);
      fill (127, 79, 191);
      textSize (40);
      text ("Pick your character by pressing A, B, C, or D", 700, 400);
    } 
    else {
      this.state = "play";
      this.clock.paused = false;
    } 
  }
  
  
  void display_play () {
    if (this.clock.completed == false) {
      background (0);
      textAlign (CENTER);
      fill (53, 84, 175);
      textSize (40);
      text ("You selected character " + this.character, 700, 400);
      
      textAlign (RIGHT);
      fill (53, 84, 175);
      textSize (30);
      text ("clock:  " + str (this.clock.time_ellapsed), 1350, 40);
      text ("to pause press p", 1350, 70);
      
      this.player_score.display ();
      
      this.clock.update ();
    }
    else {
      this.character = "none";
      this.state = "over";
    }
  }
  
  
  void display_paused () {
    background (0);
    textAlign (CENTER);
    fill (198, 38, 113);
    textSize (40);
    text ("The game is paused", 700, 400);
    
    textAlign (RIGHT);
    fill (198, 38, 113);
    textSize (30);
    text ("clock:  " + str (this.clock.time_ellapsed), 1350, 40);
    text ("to play press p", 1350, 70);
  }
  
  
  void display_over () {
    background (0);
    textAlign (CENTER);
    fill (44, 173, 68);
    textSize (40);
    text ("The game is over. If you would like to play again, press Q", 700, 400);
  }
  

}