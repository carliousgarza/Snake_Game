class Food {

  int screenWidth, screenHeight;
  int w = 20;
  int h = 20;
  int x;
  int y;

  Food(int screenWidth, int screenHeight) {
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.x = this.w*(int)(Math.ceil(Math.abs(floor(random(0, screenWidth-this.w))/this.w)));
    this.y = this.h*(int)(Math.ceil(Math.abs(floor(random(0, screenHeight-this.h))/this.h)));
  }

  void show() {
    noStroke();
    fill(255,0,255);
    rect(this.x, this.y, this.w, this.h);
  }

  void relocate() {
    this.x = this.w*(int)(Math.ceil(Math.abs(floor(random(0, this.screenWidth-this.w))/this.w)));
    this.y = this.h*(int)(Math.ceil(Math.abs(floor(random(0, this.screenHeight-this.h))/this.h)));
  }
}
