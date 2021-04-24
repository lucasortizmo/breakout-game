void intro () {
  // visuals
  image(gifi[fi], width/2, height/2, width, height + 100);
  if (frameCount % 1 == 0) fi = fi + 1;
  if (fi == frameNi) fi = 0;
  word (155, 200, "B", lime);
  word(270, 200, "R", lava);
  word(405, 200, "E", watermelon);
  word(530, 200, "A", sea);
  word(655, 200, "K", purple);
  word(780, 200, "O", blood);
  word(905, 200, "U", leaf);
  word(1030, 200, "T", banana);
  intro.play();

  // instructions
  fill(lime);
  textSize(50);
  textAlign(CENTER);
  text("BREAK ALL THE BRICKS", width/2, height/2 + 100);
  textSize(50);
  text("YOU HAVE 3 LIVES", width/2, height/2);
   
  bx = width/2;
  by = height/2 + 100;
  vx = random(-2, 2);
  vy = 5;
  lives = 3;
  score = 0;
  px = width/2;
  
  int i = 0;
  while (i < pgs) {
  alive[i] = true;
  i = i + 1;
  }
}

void introClicks () {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = GAME;
  }
}
