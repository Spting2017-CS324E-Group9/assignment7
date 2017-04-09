import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

game game_1;

// Dennis{
Minim minim; 
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;
// }Dennis

void setup () {
  size (1400, 800);
  game_1 = new game ();

  // Dennis{
  minim = new Minim(this);   
  mySound = minim.loadFile("Epic_Sax_Guy.mp3");
  // }Dennis
}


void draw () {
  if (game_1.state == "quit") {
    exit ();
  }
  else {
    game_1.run ();
  }

}

void keyPressed () {
  if (game_1.state == "init") {
    if ((key == 'a')) {
      game_1.character = "Banana";
      //Dennis{
      this.mySound.play();
      this.beat = new BeatDetect();
      this.beat.setSensitivity(400);
      this.bl = new BeatListener(beat, mySound); 
      // }Dennis
    }
    else if ((key == 'b')) {
      game_1.character = "Goku";
      //Dennis{
      this.mySound.play();
      this.beat = new BeatDetect();
      this.beat.setSensitivity(400);
      this.bl = new BeatListener(beat, mySound); 
      // }Dennis
    }
    else if ((key == 'c')) {
      game_1.character = "Sonic";
      //Dennis{
      this.mySound.play();
      this.beat = new BeatDetect();
      this.beat.setSensitivity(400);
      this.bl = new BeatListener(beat, mySound); 
      // }Dennis
    }
     else if ((key == 'd')) {
      game_1.character = "Aqua";
      //Dennis{
      this.mySound.play();
      this.beat = new BeatDetect();
      this.beat.setSensitivity(400);
      this.bl = new BeatListener(beat, mySound); 
      // }Dennis
    }
    
  }
  }
  else if ((game_1.state == "play") && (key == 'p')) {
    game_1.state = "pause";
    // Dennis{
    mySound.pause();
    // }Dennis
    game_1.clock.paused = true;
  }
  // I can't get this score update to work
  else if ((game_1.state == "play") && (key == game_1.command.charAt (0))) {
    game_1.player_score.update (10);
  }
  else if ((game_1.state == "pause") && (key == 'p')) {
    game_1.state = "play";
    // Dennis{
    mySound.play();
    // }Dennis
    game_1.clock.paused = false;
  }
  else if ((game_1.state == "pause") && (key == 'q')) {
    game_1.state = "quit";
  }
  else if ((game_1.state == "over") && (key == 'a')) {
    game_1.state = "init";
    game_1.clock = new timer (millis (), 60);
  }
  else if ((game_1.state == "over") && (key == 'q')) {
    game_1.state = "quit";
  }
}
