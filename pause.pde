void pausescreen () {
  fill(blood);
  textSize(100);
  text("PAUSE", width/2 - 155, height/2 + 150);
}

void pauseClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = GAME;
  }
}
