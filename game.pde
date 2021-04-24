void game () {
  // visuals
  image(gaspace, 500, 400, 1000, 800);
  intro.pause();

  // draw paddle
  fill(paddle);
  stroke(5);
  strokeWeight(3);
  circle(px, py, pd);

  // move paddle
  if (akey == true) px = px - 20;
  if (dkey == true) px = px + 20;
  if (px + pd/2 > width) {
    px = width - pd/2;
  }
  if (px - pd/2 < 0) {
    px = 0 + pd/2;
  }

  // draw ball
  fill(banana);
  stroke(5);
  circle(bx, by, bd);

  // bounce ball
  if (by < 0 + bd/2) {
    vy = vy * -1;
    bounce.play();
    bounce.rewind();
  } else if (bx < 0 + bd/2) {
    vx = vx * -1;
    bx = bd/2 + vx; //to correct potential glitch against left walls
    bounce.play();
    bounce.rewind();
  } else if (bx > width - bd/2) {
    vx = vx * -1;
    bx = width - bd/2 + vx; //to correct potential glitch against right walls
    bounce.play();
    bounce.rewind();
  }

  // circle collisions
  if (dist(bx, by, px, py) < bd/2 + pd/2) {
    vx = (bx - px)/10;
    vy = (by - py)/10;
    bounce.play();
    bounce.rewind();
    
  }


  // bricks
   int i = 0;
   while (i < pgs) {
     if (alive[i] == true) {
      manageBrick(i);
     } 
     i = i+1;
  } 
  
   // lives change
  if (by >= height) {
    lives = lives - 1;
    timer = 100;
    bx = width/2;
    by = height/2 + 100;
    vx = random(-2, 2);
    vy = 3;
    life.play();
    life.rewind();
  }
  
  if (timer < 0) {
    if (vy == 0) { //to avoid getting stuck in a horizontal line 
      vy = 1;
    }
    bx = bx + vx;
    by = by + vy;
  }
  
  // score
  textSize(50);
  textAlign(CORNER);
  text("Score: " + score, 700, height - 100);
  text("Lives: " + lives, 100, height - 100);
  if (score == 36) {
    mode = GAMEOVER;
    win.play();
  } else if (score == 35) {
    lastpt.play();
  } else if (lives == 1) {
    danger.play();
  } else if (lives == 0) {
    mode = GAMEOVER;
    lose.play();
    danger.pause();
  }
  
  // timer
  timer = timer - 5;
}

void gameClicks () {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = PAUSE;
  }
}
