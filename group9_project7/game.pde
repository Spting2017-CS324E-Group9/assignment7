class game {

  String state;
  String character;
  timer clock;
  score player_score;
  String command;
  Animation a1,a2,a3,a4;
  game () {
    state = "init";
    character = "none";
    command = "none";
    player_score = new score (1200, 60, 50);
    clock = new timer (0, 60);
    a1 = new Animation("Banana_",8);
    a2 = new Animation("Goku_",13);
    a3 = new Animation("Sonic_",8);
    a4 = new Animation("Girl_",18);
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
  
  void display_command () {
    textAlign (CENTER);
    fill (53, 84, 175);
    textSize (40);
    text ("Press " + this.command.toUpperCase () + " to increase score", 700, 400);
  }
  
  
  void display_init () {
    if (this.character == "none") {
      background (0);
      a1.display(100,300);
      a2.display(400,300);
      a3.display(700,300);
      a4.display(1000,300);
      textAlign (CENTER);
      fill (127, 79, 191);
      textSize (60);
      text ("Pick your character by pressing", 700, 100);
      text ("      A             B           C              D      ",700,275);
    } 
    else {
      this.state = "play";
      this.clock.paused = false;
    } 
  }
  
  
  void display_play () {
    if (this.clock.completed == false) {
      background (0);
      if (this.character == "Banana") {
        Banana.display(550,250);
      }
      else if (this.character == "Goku") {
        
        Goku.display(550,250);
      }
      else if (this.character == "Sonic") {
        
        Sonic.display(550,250);
      }
      else if (this.character == "Aqua") {
       
        Aqua.display(550,250);
      }
      if (this.clock.time_ellapsed < 60) {
        textAlign (CENTER);
        fill (53, 84, 175);
        textSize (40);
        text ("You selected character " + this.character, 700, 400);
      }
      else {
        this.display_command ();
      }
      
      textAlign (RIGHT);
      fill (53, 84, 175);
      textSize (30);
      text ("clock:  " + str (this.clock.duration - this.clock.time_ellapsed), 1350, 40);
      text ("to pause press P", 1350, 70);
      
      
      if (this.clock.time_ellapsed % 120 == 0) {
        int r = int (random (4));
        if (r == 0) {
          this.command = "w";
        }
        else if (r == 1) {
          this.command = "a";
        }
        else if (r == 2) {
          this.command = "s";
        }
        else if (r == 3) {
          this.command = "d";
        }
      }
      
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
    text ("The game is paused \n To play, press P \n To quit, press Q", 700, 400);
    
    textAlign (RIGHT);
    fill (198, 38, 113);
    textSize (30);
    text ("clock:  " + str (this.clock.duration - this.clock.time_ellapsed), 1350, 40);
    text ("to play press P", 1350, 70);
    
    this.player_score.display ();
  }
  
  
  void display_over () {
    background (0);
    textAlign (CENTER);
    fill (44, 173, 68);
    textSize (40);
    text ("The game is over. \n If you would like to play again, press A \n If you would like to quit, press Q", 700, 400);
  }
  

}
