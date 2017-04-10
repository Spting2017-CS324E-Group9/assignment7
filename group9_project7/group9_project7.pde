import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Dennis{
Minim minim; 
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;
// }Dennis

game game_1;






void setup () {
  size (1400, 800);
  
  // Dennis{
  minim = new Minim(this);   
  mySound = minim.loadFile("RickRoll.mp3");
  // }Dennis
  
  game_1 = new game(minim,mySound,beat,bl);


}


void draw () {
  if (game_1.state == "quit") {
    exit ();
  }
  else {
    //if(this.beat.isOnset()){this.onBeat=true;};
    game_1.run();
  }

}

void keyPressed () {
  
  if (game_1.state == "init") {
    if ((key == 'a')) {
      game_1.character = "Banana";
      game_1.c = game_1.a1;
      game_1.c.cont = false;
    }
    else if ((key == 'b')) {
      game_1.character = "Goku";
      game_1.c = game_1.a2;
      game_1.c.cont = false;
    }
    else if ((key == 'c')) {
      game_1.character = "Sonic";
      game_1.c = game_1.a3;
      game_1.c.cont = false;
    }
     else if ((key == 'd')) {
      game_1.character = "Aqua";
      game_1.c = game_1.a1;
      game_1.c.cont = false;
    }
    
  }

  else if ((game_1.state == "play") && (key == 'p')) {
    game_1.state = "pause";
    game_1.clock.paused = true;
  }
  

  else if ((game_1.state == "play") && (key == Character.toLowerCase(game_1.Letters.get(0).command)) && (game_1.Letters.get(0).letter_in_circle())) {

    game_1.c.cont = true;
    if(game_1.Letters.get(0).command == 'A'){

      noStroke();
      fill(0,250,0);
      ellipse(50,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("Awesome!",170,200);
    }
    else if(game_1.Letters.get(0).command == 'W'){
      noStroke();
      fill(0,250,0);
      ellipse(130,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("Incredible!",170,200);
    }
    else if(game_1.Letters.get(0).command == 'S'){
      noStroke();
      fill(0,250,0);
      ellipse(210,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("WOW!",170,200);
    }
    else if(game_1.Letters.get(0).command == 'D'){
      noStroke();
      fill(0,250,0);
      ellipse(290,700,78,78);
      game_1.Letters.remove(0);
      
      stroke(0,250,0);
      textAlign(CENTER,CENTER);
      text("Keep it up!",170,200);
    }
    game_1.player_score.update (10);
  }
  else if( (game_1.state == "play") && ( (key != Character.toLowerCase(game_1.Letters.get(0).command)) || !(game_1.Letters.get(0).letter_in_circle()) ) ){
    game_1.c.cont = false;
    if(key=='a'){
      noStroke();
      fill(250,0,0);
      ellipse(50,700,78,78);
      game_1.player_score.update(-10);
    }
    if(key=='w'){
      noStroke();
      fill(250,0,0);
      ellipse(130,700,78,78);
      game_1.player_score.update(-10);
    }
    if(key=='s'){
      noStroke();
      fill(250,0,0);
      ellipse(210,700,78,78);
      game_1.player_score.update(-10);
    }
    if(key=='d'){
      noStroke();
      fill(250,0,0);
      ellipse(290,700,78,78);
      game_1.player_score.update(-10);
    }    
  }
  
  
  
  else if ((game_1.state == "pause") && (key == 'p')) {
    game_1.state = "play";
    game_1.clock.paused = false;
  }
  else if ((game_1.state == "pause") && (key == 'q')) {
    game_1.state = "quit";
  }
  else if ((game_1.state == "over") && (key == 'q')) {
    game_1.state = "quit";
  }
}