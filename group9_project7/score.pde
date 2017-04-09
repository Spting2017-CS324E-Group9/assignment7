class score {

  float max, current;
  PShape meter_outline, meter_fill;
  color meter_color;
  float x, y;
  score (int m, float ix, float iy) {
    max = m;
    x = ix;
    y = iy;
    current = max / 3;
    meter_color = color (lerp (229, 27, this.current / this.max), lerp (14, 203, this.current / this.max), lerp (2, 25, this.current / this.max));
    
    meter_outline = createShape (GROUP);
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
    
    meter_fill = createShape (RECT, x + 5, y + 5, lerp (y + 5, 90, this.current / this.max), 20);
    meter_fill.setFill (meter_color);
  }
  
  void update (int change) {
    this.current += change;
    if (this.current >= this.max) {
      this.current = this.max;
    }
    this.meter_color = color (lerp (229, 27, this.current / this.max), lerp (14, 203, this.current / this.max), lerp (2, 25, this.current / this.max));
    this.meter_fill = createShape (RECT, this.x + 5, this.y + 5, lerp (this.x + 5, 90, this.current / this.max), 20);
    this.meter_fill.setFill (meter_color);
  }
  
  void display () {
    textAlign (LEFT);
    fill (53, 84, 175);
    textSize (30);
    text ("CoolPoints:  " + str (int (this.current)), this.x, this.y - 10);
    shape (this.meter_fill);
    shape (this.meter_outline);
    
  }


}