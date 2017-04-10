class letter{
  char command;
  float y=300;
  int location;
  
  letter(char _command, int _location){
    this.command = _command;
    this.location = _location;
  }
  
  void drop_letter(){
    stroke(250);
    fill(250);
    textAlign(CENTER,CENTER);
    if(this.command == 'A'){
      text("A",50,this.y+=1);
    }
    if(this.command == 'W'){
      text("W",130,this.y+=1);
    }
    if(this.command == 'S'){
      text("S",210,this.y+=1);
    }
    if(this.command == 'D'){
      text("D",290,this.y+=1);
    }


  }

  
  boolean letter_in_circle(){
    if(this.y>660 && this.y<740){
      return true;
    }
    else{return false;}
  }
  
  
  
}