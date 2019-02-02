//the text you want
String text = "I am a dummy!";
//output filename (it overwrites!)
String filename = "output.flame";
//random colors for each letter if true
Boolean random_colors = true;






PFont font;

String[] params = new String[1];


void setup(){
  size(600,300);
  background(255);

  font = createFont("wide_pixel-7.ttf", 10);
  textFont(font);
  
  params[0] = p1;
  
  int x0 = 10; //<>//
  int c0 = 0;
  for (int i=0; i<text.length(); i++){
    ArrayList<Block> xformText = processLetter(text.charAt(i), x0);
    float col = (random_colors) ? random(1) : 0;
    for (int j=0; j< xformText.size(); j++){
      Block xf = xformText.get(j); //<>//
      String xform = makeP2(xf.x0 + c0, xf.y0, xf.wd, xf.hd, col, text.charAt(i));
      params = expand(params, params.length + 1);
      params[params.length - 1] = xform;
    }
    x0 += int(textWidth(text.charAt(i))+1) * 6; //<>//
    c0 += int(textWidth(text.charAt(i))+1);
  }

  params = expand(params, params.length + 1);
  params[params.length - 1] = p3;
  params = expand(params, params.length + 1);
  params[params.length - 1] = p4;
  saveStrings(filename, params);
  println("SAVED");

  
}

void draw(){
  
}

ArrayList<Block> processLetter(char t, int x0){
  float tw = textWidth(t);
  float th = textAscent() + textDescent();
    
  PGraphics textPic = createGraphics(int(tw+1), int(th+1));
  textPic.beginDraw();
  textPic.background(255);
  textPic.noStroke();
  textPic.fill(0);
  textPic.textFont(font);
  textPic.textAlign(LEFT,TOP);
  textPic.text(t, 0, 0);
  textPic.endDraw();
 
  ArrayList<Block> textBlock = cleanLetter(textPic);
  drawBlocks(textBlock, x0, 70, 6);
  return(textBlock);
}
