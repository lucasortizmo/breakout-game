void gameover () {
  if (score == 36) {
    image(gif[f], width/2, height/2, width, height + 100);
    if (frameCount % 1 == 0) f = f + 1;
    if (f == frameNi) f = 0;
    fill(lava);
    textSize(50);
    text("click anywhere to play again", width/2 - 300, height/2 + 200);
  } else if (lives == 0) {
    image(gifl[fl], width/2, height/2, width, height + 100);
    if (frameCount % 1 == 0) fl = fl + 1;
    if (fl == framel) fl = 0;
    fill(lava);
    textSize(50);
    text("click anywhere to try again", width/2 - 300, height/2 + 200);
  }
}

void gameoverClicks () {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = INTRO;
  }
}
