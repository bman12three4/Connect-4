int[][] position = new int[8][7];
int counter = 0;
int winner = 0;
int[] undo = {0, 0};
boolean PvP = true;
void setup() {
  size(800, 600);
  for (int x = 0; x <= width; x += width/7) { 
    line(x, 0, x, height);
  } 
  for (int y = 0; y <= height; y += height/6) {
    line(0, y, width, y);
  }
  for (int i = 1; i <= 7; i++) {
    for (int g=1; g<=6; g++) {
      position[i][g]=0;
    }
  }
  c = new Client(this,"10.10.45.128", 12345);
}
void mousePressed() {
  int x = 0;
  if (counter % 2 == 1) {
     x = mouseX;
  if (x<=width/7 && x>0) {
    x = 1;
  } else if (x<=width/7*2 && x>=width/7) {
    x = 2;
  } else if (x<=width/7*3 && x>=width/7) {
    x = 3;
  } else if (x<=width/7*4 && x>=width/7) {
    x = 4;
  } else if (x<=width/7*5 && x>=width/7) {
    x = 5;
  } else if (x<=width/7*6 && x>=width/7) {
    x = 6;
  } else if (x<=width/7*7 && x>=width/7) {
    x = 7;
  }
  c.write(x+" "+"\n");
  counter++;
  println(counter);
  }else{
  }
  a(x);
}
void a(int x){
  ellipseMode(CENTER);
  if (counter % 2 == 1) {
    for (int i = 1; i <= 6; i++) {
      if (position[x][i] ==0) {
        fill(225, 225, 0);
        ellipse((width/7*x)-(width/7)/2, height/6*(6-i)+(height/6)/2, width/7, height/6);
        position[x][i] = 1;
        undo[0]= x;
        undo[1]= i;
        break;
      }
    }
  } else {
    for (int i = 1; i <= 6; i++) {
      if (position[x][i] ==0) {
        fill(225, 0, 0);
        ellipse((width/7*x)-(width/7)/2, height/6*(6-i)+(height/6)/2, width/7, height/6);
        position[x][i] = 2;
        undo[0]= x;
        undo[1]= i;
        break;
      }
    }
  }
}
void draw() {
  //Horizontal
  if (c.available() > 0 && counter % 2 == 0) {
      input = c.readString();
    input = input.substring(0, input.indexOf("\n"));
    data = int(split(input, ' '));
    int x = data[0];
    counter++;
    a(x);
     println("a");
    }
  for (int i = 0; i<=3; i++) {
    for (int g = 0; g <= 5; g++) {
      if (position[i+1][g+1] ==position[i+2][g+1] && position[i+3][g+1]==position[i+1][g+1]&&position[i+4][g+1]==position[i+1][g+1]&&position[i+1][g+1]==1) {
        winner = 1;
      } else if (position[i+1][g+1] ==position[i+2][g+1] && position[i+3][g+1]==position[i+1][g+1]&&position[i+4][g+1]==position[i+1][g+1]&&position[i+1][g+1]==2) {
        winner = 2;
      }
    }
    //Diagonal 
    for (int g = 0; g <=2; g++) {
      if (position[i+1][g+1]==position[i+2][g+2]&&position[i+2][g+2]==position[i+3][g+3]&&position[i+3][g+3]==position[i+4][g+4]&&position[i+3][g+3]==1) {
        winner = 1;
      } else if (position[i+1][g+1]==position[i+2][g+2]&&position[i+2][g+2]==position[i+3][g+3]&&position[i+3][g+3]==position[i+4][g+4]&&position[i+3][g+3]==2) {
        winner = 2;
      }
      if (position[7-i][g+1]==position[6-i][g+2]&&position[6-i][g+2]==position[5-i][g+3]&&position[5-i][g+3]==position[4-i][g+4]&&position[7-i][g+1]==1) {
        winner = 1;
      } else if (position[7-i][g+1]==position[6-i][g+2]&&position[6-i][g+2]==position[5-i][g+3]&&position[5-i][g+3]==position[4-i][g+4]&&position[7-i][g+1]==2) {
        winner = 2;
      }
    }
  }
  //Verticle
  for (int i = 0; i <=2; i++) {
    for (int g = 0; g <= 6; g++) {
      if (position[g+1][i+1]==position[g+1][i+2]&&position[g+1][i+2]==position[g+1][i+3]&&position[g+1][i+3]==position[g+1][i+4]&&position[g+1][i+4]==1) {
        winner = 1;
      } else if (position[g+1][i+1]==position[g+1][i+2]&&position[g+1][i+2]==position[g+1][i+3]&&position[g+1][i+3]==position[g+1][i+4]&&position[g+1][i+4]==2) {
        winner = 2;
      }
    }
  }
  if (winner != 0) {
    textSize(50); 
    fill(0, 225, 0);
    textAlign(CENTER);
    if (winner == 1) {
      text("Yellow Wins", width/2, height/2);
    } else {
      text("Red Wins", width/2, height/2);
    }
    stop();
  }
  if (PvP == false && counter % 2 == 0) {
    AI();
  }
}

class ChildApplet extends PApplet {
  //JFrame frame;

  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(400, 400, P3D);
    smooth();
  }
  public void setup() { 
    surface.setTitle("Child sketch");
    arcball2 = new Arcball(this, 300);
  }
}