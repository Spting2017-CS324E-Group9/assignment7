class game {
  
  Minim minim; 
  AudioPlayer mySound;
  BeatDetect beat;
  BeatListener bl;


  
  //letter[] Letters;
  letter letter;
  ArrayList<letter> Letters = new ArrayList<letter>();
  int i=0;
  //boolean foundLetter = false;
  color circle_colorA = color(250);
  color circle_colorW = color(250);
  color circle_colorS = color(250);
  color circle_colorD = color(250);
  Animation c;
  String state;
  String character;
  timer clock;
  score player_score;
  char command;
  Animation a1,a2,a3,a4;
  game (Minim _minim, AudioPlayer _mySound, BeatDetect _beat, BeatListener _bl) {
    
    this.minim = _minim; 
    this.mySound = _mySound;
    this.beat = _beat;
    this.bl = _bl;
    
    state = "init";
    character = "none";
    command = ' ';
    player_score = new score (1200, 60, 50);
    clock = new timer (0, 212);
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
    else if (this.state == "fail") {
      this.display_fail ();
    }
  }
  
  void display_command () {
    textAlign (CENTER);
    textSize(30);
    noFill();
    stroke(circle_colorA);
    ellipse(50,700,80,80);
    text("A",50,780);
    
    stroke(circle_colorW);
    ellipse(130,700,80,80);
    text("W",130,780);
    
    stroke(circle_colorS);
    ellipse(210,700,80,80);
    text("S",210,780);
    
    stroke(circle_colorD);
    ellipse(290,700,80,80);
    text("D",290,780);
    

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
      text ("      A             B            C              D      ",700,275);
      text ("EASY", 250, 675);
      text ("MEDIUM", 550, 675);
      text ("HARD", 850, 675);
      text ("EXTREME", 1150, 675);
    } 
    else {
      this.c.cont=false;
      this.state = "play";
      this.clock.paused = false;
      this.mySound.play();
      this.beat = new BeatDetect();
      if (this.character == "Banana") {
        this.beat.setSensitivity(1500);
      }
      else if (this.character == "Goku") {
        this.beat.setSensitivity(1300);
      }
      else if (this.character == "Sonic") {
        this.beat.setSensitivity(1100);
      }
      else if (this.character == "Aqua") {
        this.beat.setSensitivity(900);
      }
      this.bl = new BeatListener(beat, mySound); 
    } 
  }

  void display_play () {
    if (this.clock.completed == false) {
      background (0);
      if (this.character == "Banana"){
        background(34,177,76);
        a1.display(550,250);
        c=a1;
      }
      else if (this.character == "Goku"){
        background(128,0,128);
        a2.display(550,250);
        c=a2;
        
      }
      else if (this.character == "Sonic"){
        background(34,177,76);
        a3.display(550,250);
        c=a3;
      }
      else if (this.character == "Aqua"){
        background(255,0,255);
        a4.display(550,250);
        c=a4;
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
      this.mySound.play();
      textAlign (RIGHT);
      fill (53, 84, 175);
      textSize (30);
      text ("clock:  " + str (this.clock.duration - this.clock.time_ellapsed), 1350, 40);
      text ("press P to pause", 1350, 70);
      
      if(this.beat.isOnset()){
        int r = int (random (4));
        if (r == 0) {
          this.command = 'W';
          this.Letters.add(new letter(this.command,this.i));
          i+=1;
        }
        else if (r == 1) {
          this.command = 'A';
          this.Letters.add(new letter(this.command,this.i));
          i+=1;        
        }
        else if (r == 2) {
          this.command = 'S';
          this.Letters.add(new letter(this.command,this.i));
          i+=1;        
        }
        else if (r == 3) {
          this.command = 'D';
          this.Letters.add(new letter(this.command,this.i));
          i+=1;        
        }
      }
      
      this.player_score.display ();
      this.clock.update ();
      
      if(!Letters.isEmpty()){
        for(int j=0; j<Letters.size();j++){
           Letters.get(j).drop_letter();
          
        }
        if(Letters.get(0).y>740){
          Letters.remove(0);
          this.player_score.update(-10);
          this.c.cont=false;
        }
       
      }
      if (this.player_score.current < 0) {
        this.state = "fail";
      }
    }
    else {
      this.character = "none";
      this.state = "over";
    }
  }
  
  
  void display_paused () {
    this.mySound.pause();
    background (0);
    textAlign (CENTER);
    fill (198, 38, 113);
    textSize (40);
    text ("The game is paused \n To play, press P \n To quit, press Q", 700, 400);
    
    textAlign (RIGHT);
    fill (198, 38, 113);
    textSize (30);
    text ("clock:  " + str (this.clock.duration - this.clock.time_ellapsed), 1350, 40);
    text ("press P to play", 1350, 70);
    
    this.player_score.display ();
  }
  
  
  void display_over () {
    this.mySound.rewind();
    background (0);
    textAlign (CENTER);
    fill (44, 173, 68);
    textSize (40);
    text ("YOU NEVER GAVE US UP! \n You score was: "+str(int(this.player_score.current))+ " CoolPoints \n To quit, press Q", 700, 400);
  }
  
  void display_fail () {
    this.mySound.rewind();
    background (0);
    textAlign (CENTER);
    fill (44, 173, 68);
    textSize (40);
    text ("YOU LET US DOWN! \n To quit, press Q", 700, 400);
  }
  
  // Dennis{
  void stop()
  {
    // always close Minim audio classes when you are finished with them
    mySound.close();
    // always stop Minim before exiting
    minim.stop();
    // this closes the sketch
    this.stop();
  }
  // }Dennis
  

}