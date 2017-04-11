class timer {

  int start_time, time_ellapsed, duration;
  boolean paused;
  boolean completed; 
  String formatted_display;
  
  // The argument dur is in seconds, but the variables duration and time_ellapsed are in loops, i.e. seconds * 60
  timer (int st, int dur) {
    paused = true;
    completed = false;
    start_time = st;
    duration = 60 * dur;
    time_ellapsed = 0;
  }
  
  void update () {
    if ((this.paused == false) && (this.completed == false)) {
      this.time_ellapsed += 1;
      if (this.time_ellapsed >= this.duration) {
        this.paused = true;
        this.completed = true;
      }
    }
  }
  
  void pause () {
    this.paused = true;
  }
  

} 