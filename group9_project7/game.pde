class game {

  String state;
  String character;
  timer clock;
  game () {
    state = "init";
    character = "none";
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
      text ("Pick your character by pressing A, B, C, or D", 550, 350);
    } 
    else {
      this.state = "play";
    } 
  }
  
  
  void display_play () {
    if (this.clock.completed == false) {
      background (0);
      textAlign (CENTER);
      fill (53, 84, 175);
      textSize (40);
      text ("You selected character " + this.character, 550, 350);
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
    text ("The game is paused", 550, 350);
  }
  
  
  void display_over () {
    background (0);
    textAlign (CENTER);
    fill (44, 173, 68);
    textSize (40);
    text ("The game is over. If you would like to play again, press Q", 600, 350);
  }
  

}