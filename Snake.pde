class Snake {

  int x;
  int y;
  int w = 20;
  int h = 20;
  ArrayList<PVector> snakeTrail = new ArrayList<PVector>();
  int snakeSize = 1;
  String currentDirection = "up";
  int hue = 100;

  Snake(int x, int y) {
    this.x = x;
    this.y = y;
    this.snakeTrail.add(new PVector(x, y));
  }

  void show() {
    for (PVector v : this.snakeTrail) {
      stroke(0);
      fill(this.hue, 255, 255);
      rect(v.x, v.y, this.w, this.h);
    }
  }

  Boolean checkCollisionWithItself() {
    for (int i=this.snakeTrail.size()-1; i>0; i--) {
      if (this.snakeTrail.get(i).x == this.x && this.snakeTrail.get(i).y == this.y) {
        return true;
      }
    }

    return false;
  }

  Boolean leftMap(int mapW, int mapH) {

    if (this.x < 0 || this.x >= mapW || this.y < 0 || this.y >= mapH) {
      return true;
    }
    return false;
  }

  void update() {
    switch(this.currentDirection) {
    case "up":
      for (int i=this.snakeTrail.size()-1; i>0; i--) {
        this.snakeTrail.set(i, new PVector(this.snakeTrail.get(i-1).x, this.snakeTrail.get(i-1).y));
      }
      this.snakeTrail.set(0, new PVector(this.snakeTrail.get(0).x, this.snakeTrail.get(0).y - this.h));
      break;
    case "down":
      for (int i=this.snakeTrail.size()-1; i>0; i--) {
        this.snakeTrail.set(i, new PVector(this.snakeTrail.get(i-1).x, this.snakeTrail.get(i-1).y));
      }
      this.snakeTrail.set(0, new PVector(this.snakeTrail.get(0).x, this.snakeTrail.get(0).y + this.h));
      break;
    case "left":
      for (int i=this.snakeTrail.size()-1; i>0; i--) {
        this.snakeTrail.set(i, new PVector(this.snakeTrail.get(i-1).x, this.snakeTrail.get(i-1).y));
      }
      this.snakeTrail.set(0, new PVector(this.snakeTrail.get(0).x - this.w, this.snakeTrail.get(0).y));
      break;
    case "right":
      for (int i=this.snakeTrail.size()-1; i>0; i--) {
        this.snakeTrail.set(i, new PVector(this.snakeTrail.get(i-1).x, this.snakeTrail.get(i-1).y));
      }
      this.snakeTrail.set(0, new PVector(this.snakeTrail.get(0).x + this.w, this.snakeTrail.get(0).y));
      break;
    }
    this.x = round(this.snakeTrail.get(0).x);
    this.y = round(this.snakeTrail.get(0).y);
  }

  void changeDirection(String key_pressed) {

    switch(key_pressed) {
    case "up":
      if (this.currentDirection != "down") {
        this.currentDirection = key_pressed;
      }
      break;
    case "down":
      if (this.currentDirection != "up") {
        this.currentDirection = key_pressed;
      }
      break;
    case "left":
      if (this.currentDirection != "right") {
        this.currentDirection = key_pressed;
      }
      break;
    case "right":
      if (this.currentDirection != "left") {
        this.currentDirection = key_pressed;
      }
      break;
    }
  }

  void increaseSnakeSize() {
    this.snakeSize++;
    if (this.hue > 255) {
      this.hue = 0;
    }
    this.hue += 30;
    PVector snakeTail = this.snakeTrail.get(snakeTrail.size()-1);
    switch(this.currentDirection) {
    case "up":
      //add below tail
      this.snakeTrail.add(new PVector(snakeTail.x, snakeTail.y + h));
      break;
    case "down":
      //add above tail
      this.snakeTrail.add(new PVector(snakeTail.x, snakeTail.y - h));
      break;
    case "left":
      //add to right of tail
      this.snakeTrail.add(new PVector(snakeTail.x + w, snakeTail.y));
      break;
    case "right":
      //add to left of tail
      this.snakeTrail.add(new PVector(snakeTail.x - w, snakeTail.y));
      break;
    }
  }
}
