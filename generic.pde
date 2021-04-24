void word (int x, int y, String letter, color c) {
  fill(c);
  textFont(breakout);
  textSize(100);
  text(letter, x-100, y);
}

void manageBrick (int i) {
  if (y[i] == 50) fill(blood);
  if (y[i] == 150) fill(watermelon); 
  if (y[i] == 250) fill(sea); 
  if (y[i] == 350) fill(leaf); 
  stroke(5);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
  vx = (bx - x[i])/2;
  vy = (by - y[i])/2;
  alive[i] = false;
  score++;
  broken.play();
  broken.rewind();
  }
}

void bricklive (int i) {
alive[i] = true;
}
