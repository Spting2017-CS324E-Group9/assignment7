class score {

  int max, current;
  PShape meter;
  float x, y;
  score (int m, float ix, float iy) {
    max = m;
    x = ix;
    y = iy;
    current = max / 2;
    
    meter = createShape (GROUP);
    PShape meter_outline = createShape (GROUP);
    PShape outline_left = createShape (RECT, x, y, 5, 30);
    PShape outline_right = createShape (RECT, x + 95, y, 5, 30);
    PShape outline_top = createShape (RECT, x, y, 100, 5);
    PShape outline_bottom = createShape (RECT, x, y + 25, 100, 5);
    outline_left.setFill (100);
    outline_right.setFill (100);
    outline_top.setFill (100);
    outline_bottom.setFill (100);
    
    outline_left.setStroke (false);
    outline_right.setStroke (false);
    outline_top.setStroke (false);
    outline_bottom.setStroke (false);
    
    meter_outline.addChild (outline_left);
    meter_outline.addChild (outline_right);
    meter_outline.addChild (outline_top);
    meter_outline.addChild (outline_bottom);
    meter.addChild (meter_outline);
  }
  
  void update (int change) {
    this.current += change;
  }
  
  void display () {
    textAlign (LEFT);
    fill (53, 84, 175);
    textSize (30);
    text ("CoolPoints:  " + str (this.current), this.x, this.y - 10);
    shape (this.meter);
  }


}