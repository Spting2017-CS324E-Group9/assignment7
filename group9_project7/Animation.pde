class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    

    for (int i = 0; i < imageCount ; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i+1, 4) + ".gif";
      images[i] = loadImage(filename);
      images[i].resize(300,300);
     
    }
  }

  void display(float xpos, float ypos) {
   
    if (frameCount % 10 == 0) { 
    frame = (frame+1) % (imageCount);
    }
    image(images[frame], xpos, ypos);
  }  
}
