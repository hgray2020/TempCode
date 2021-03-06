void maps() {
  if (biomes.size() == numBiomes) {
    for (int p = 0; p < biomes.size(); p++) {
      Biome b = biomes.get(p);
      if (miniBiomes.size() < biomes.size()) {
        miniBiomes.add(new miniBiome(b.type, b.r, b.x, b.y));
      } else {
        miniBiomes.set(p, new miniBiome(b.type, b.r, b.x, b.y));
      }
    }
  }
  tot = 0;
  fill(82, 82, 255);
  strokeWeight(4);
  stroke(255);
  rect(750, 50, 150, 150);
  for (miniBiome m : miniBiomes) {
    m.display();
  }
  float minx = (sc*bSize)+400;
  float maxx = ((sc*10)*bSize)-400;
  float maxy = ((sc*2)*bSize)-400;
  float tx, ty;
  tx = map(-1*lx, -1*minx, maxx, 680, 790);
  ty = map(-1*ly, -1*minx, maxy, 40, 70);
  fill(255, 0, 0);
  noStroke();
  ellipse(tx, ty, 6, 6);
}


class miniBiome {
  int r;
  float x, y;
  int type; //0 is grassy, 1 is sandy, 2 is rocky

  miniBiome(int t, int rad, float ex, float why) {

    r = 100/(numBiomes/2);

    x = (ex/(bSize*sc))*(r/2);
    y = (why/(bSize*sc))*(r/2);

    type = t;
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(690, 50);

    if (type == 0) {
      fill(13, 146, 13);
    }
    if (type == 1) {
      fill(255, 255, 180);
    }
    if (type == 2) {
      fill(120);
    }

    rectMode(CENTER);
    rect(x, y, r, r);
    popMatrix();
  }
}