class Score {

  int score = 0;
  int x, y;
  Score(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void show() {
    pushMatrix();
    translate(-100, 0);
    textSize(50);
    fill(255,0,255);
    text("Score: " + this.score, this.x, this.y);
    popMatrix();
  }

  void update(int score) {
    this.score = score;
  }
}
