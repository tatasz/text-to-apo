class Block { 
  int x0, y0;
  int wd, hd;
  
  Block (int v0, int v1, int v2, int v3) {  
    x0 = v0;
    y0 = v1;
    wd = v2;
    hd = v3;
  } 
} 

void drawBlocks(ArrayList<Block> letter, int x0, int y0, int s){
  fill(255);
  stroke(0);
  for (int i=0; i<letter.size(); i++){
    Block l = letter.get(i);
    rect(x0 + l.x0 * s, y0 + l.y0 * s, l.wd * s, l.hd * s);
  }
}

ArrayList<Block> readText(PGraphics p){
  ArrayList<Block> letter = new ArrayList<Block>();
  for (int i=0; i<p.width; i++){
    for (int j=0; j < p.height; j++){
      color c = p.get(i, j);
      if (c < -1){
        letter.add(new Block(i, j, 1, 1));
      }
    }
  }
  return letter;
}

ArrayList<Block> cleanLetter(PGraphics p){
  ArrayList<Block> letter = readText(p);
  //merge vertically
  boolean change = true;
  while (change) {
    int c = 0;
    for (int i=0; i < letter.size() - 1; i++){
      Block let1 = letter.get(i);
      for (int j=letter.size()-1; j > i; j--){
        Block let2 = letter.get(j);
        if (let1.y0 + let1.hd == let2.y0 & let1.x0 == let2.x0){
          letter.remove(j);
          letter.get(i).hd = let1.hd + let2.hd;
          c +=1;
        }
      } 
    }
    if (c == 0) change = false;
  }
  //merge horizontally
  change = true;
  while (change) {
    int c = 0;
    for (int i=0; i < letter.size() - 1; i++){
      Block let1 = letter.get(i);
      for (int j=letter.size()-1; j > i; j--){
        Block let2 = letter.get(j);
        if (let1.x0 + let1.wd == let2.x0 & let1.y0 == let2.y0 & let1.hd == let2.hd){
          letter.remove(j);
          letter.get(i).wd = let1.wd + let2.wd;
          c +=1;
        }
      } 
    }
    if (c == 0) change = false;
  }
  return letter;
}
