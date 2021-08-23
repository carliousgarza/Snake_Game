int w = 1000;
int h = 800;

Food food = new Food(w, h);
Snake snake = new Snake(w/2, h/2);
Score scoreboard = new Score(900, 750);
int score = 0;
Boolean gameOver = false;

void setup () {
  colorMode(HSB);
  size(1000, 800);
}

void draw () {
  background(0, 0, 0);

  if (gameOver == false) {
    this.scoreboard.show();
    this.food.show();
    this.snake.show();
    if (frameCount % 5 == 0) {
      this.snake.update();
    }

    if (checkCollision() == true) {
      this.score++;
      this.scoreboard.update(this.score);
      this.snake.increaseSnakeSize();
      this.food.relocate();
    }
  } else {
    push();
    textSize(100);
    fill(0, 255, 255);
    textAlign(CENTER);
    text("Game over!", w/2, h/2);
    pop();

    stroke(255, 0, 255);
    noFill();
    rect(w/2-200, h/2+130, 400, 100, 10);

    push();
    textSize(50);
    fill(100, 255, 255);
    textAlign(CENTER);
    text("Click to play again.", w/2, h/2+200);
    pop();

    this.scoreboard.show();
  }
}

void mousePressed() {
  if (this.gameOver == true && mouseX >= w/2-200 && mouseX <= w/2+400 && mouseY >= h/2+130 && mouseY <= h/2+230) {
    newGame();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      snake.changeDirection("up");
    } else if (keyCode == DOWN) {
      snake.changeDirection("down");
    } else if (keyCode == LEFT) {
      snake.changeDirection("left");
    } else if (keyCode == RIGHT) {
      snake.changeDirection("right");
    }
  } else {
    if (key == 'w') {
      snake.changeDirection("up");
    } else if (key == 'a') {
      snake.changeDirection("left");
    } else if (key == 's') {
      snake.changeDirection("down");
    } else if (key == 'd') {
      snake.changeDirection("right");
    }
  }
}

Boolean checkCollision() {
  int snakeX = this.snake.x;
  int snakeY = this.snake.y;

  //Check if snake leaves map
  if (this.snake.leftMap(this.w, this.h) == true) {
    gameOver();
  }

  //Check collision with itself
  if (this.snake.checkCollisionWithItself() == true) {
    gameOver();
  }

  int foodX = this.food.x;
  int foodY = this.food.y;
  if (snakeX == foodX && snakeY == foodY) {
    return true;
  }
  return false;
}

void gameOver() {
  this.gameOver = true;
}

void newGame() {
  this.score = 0;
  this.scoreboard.update(0);
  this.snake = new Snake(w/2, h/2);
  this.food = new Food(w, h);
  this.gameOver = false;
}
