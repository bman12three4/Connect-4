int[][] AImap = new int[8][7];
int[][] predictum = new int[8][7];
int[] AIrows = new int[7];
int[] PAIrows = new int[7];
int[] scoring = new int[7];
void AI() {
  arrayCopy(position, AImap);
  refreshscores();
  clearAImem();
  CheckBounds(); 
  if (counter % 2 == 0) {
    int posa = rTovictory();
     int pos = yTovictory();
     if (pos != 0){
       posa = pos;
     }
    println("1 step:"+posa);
    //println(posa);
    if ( posa != 0) {
      activate(posa);
      counter++;
    }
  }
  if (counter % 2 == 0){
    LV1();
    LV2D();
    LV2A();
    LV5D();
    LV5A();
    int[] activatum = fmax(scoring);
    if ( activatum[1] != 0 ) {
      if (counter % 2 == 0) {
        println("Calculated move:"+(activatum[0]+1));
        activate(activatum[0]+1);
        counter++;
      }
    }
    activatum[0] = int(random(1, 8));
    while (scoring[activatum[0]-1] < 0 || AIrows[activatum[0]-1] == 1) {
      activatum[0] = int(random(1, 8));
      //exit();
    }
    // println(AIrows);
    if (counter % 2 == 0) {
      activate(activatum[0]);
      counter++;
      println("Lane Activated: "+activatum[0]);
    }
    println(scoring);
  }
}
void activate(int x) {
  for (int i = 1; i <= 6; i++) {
    if (position[x][i] ==0) {
      fill(225, 225, 0);
      ellipse((width/7*x)-(width/7)/2, height/6*(6-i)+(height/6)/2, width/7, height/6);
      position[x][i] = 1;
      break;
    }
  }
}
void Pactivate(int x) {
  for (int i = 1; i <= 6; i++) {
    if (predictum[x][i] ==0) {
      predictum[x][i] = 1;
      break;
    }
  }
}
void CheckBounds() {
  for (int i = 1; i <= 7; i ++) {
    boolean outofbound = true;
    for (int q = 1; q <= 6; q ++) {
      if (AImap[i][q] == 0) {
        outofbound = false;
      }
    }
    if (outofbound == true) {
      AIrows[i-1] = 1;
    }
  }
}
// Basic consciousness; Recignition
void LV1() {
  refresh();
  CheckAIbounds();
  for (int i = 0; i <= 6; i ++) {
    if (AIrows[i]==0) {
      for (int g = 0; g <= 6; g ++ ) {
        if (AIrows[g]==0) {
          Pactivate(i+1);
          CheckAIbounds();
          if (PAIrows[g]==0) {
            Pactivateo(g+1);
            int status = brain();
            if (status ==2 ) {
              scoring[i] -= 1500;
            }
          }
          refresh();
        }
      }
    }
  }
  //println(scoring);
}
//Block them !!! Block all of them!!
//Two steps calculation
//3 step calculation defense
void LV2D() {
  refresh();
  CheckAIbounds();
  for (int i = 0; i <= 6; i ++) {
    if (AIrows[i] == 0) {
      int[] uno = activatei(i+1);
      int rp1 = rTovictory();
      //println(uno);
      if (rp1 == 0) {
        position[uno[0]][uno[1]] = 0;
      } else if (rp1 != 0) {
        int dos[] = activateia(rp1);
        int rp2 = rTovictory();
        if (rp2 != 0 ) {
          scoring[i] += 600;
        }
        position[uno[0]][uno[1]] = 0;
        position[dos[0]][dos[1]] = 0;
      }
    }
  }
}
//Three step calculation attack
void LV2A() {
  refresh();
  CheckAIbounds();
  for (int i = 0; i <= 6; i ++) {
    if (AIrows[i] == 0) {
      int[] uno = activateia(i+1);
      int rp1 = yTovictory();
      if (rp1 == 0) {
        position[uno[0]][uno[1]] = 0;
      } else if (rp1 != 0) {
        int[] dos = activatei(rp1);
        int rp2 = yTovictory();
        if (rp2 != 0 ) {
          scoring[i] += 800;
        }
        position[uno[0]][uno[1]] = 0;
        position[dos[0]][dos[1]] = 0;
      }
    }
  }
}
void LV5D() {
  refresh();
  //Third Layer.
  CheckAIbounds();
  for (int i = 0; i <= 6; i ++) {
    if (AIrows[i] == 0) {
      int[] uno = activatei(i+1);
      int rp1 = rTovictory();
      if (rp1 == 0) {
        position[uno[0]][uno[1]] = 0;
      } else if (rp1 != 0) {
        int[] dos = activateia(rp1);
        for (int g = 0; g <= 6; g ++) {
          int[] tres = activatei(g+1);
          int rp2 = rTovictory();
          if (rp2 == 0) {
            position[tres[0]][tres[1]] = 0;
          } else if (rp2 != 0) {
            int cuatro[] = activateia(rp2);
            int rp3 = rTovictory();
            if (rp3 == 0) {
            } else {
              scoring[i] += 20;
            }
            position[tres[0]][tres[1]] = 0;
            position[cuatro[0]][cuatro[1]] = 0;
          }
        }
        position[uno[0]][uno[1]] = 0;
        position[dos[0]][dos[1]] = 0;
      }
    }
  }
}

void LV5A() {
  refresh();
  //Third Layer.
  CheckAIbounds();
  for (int i = 0; i <= 6; i ++) {
    if (AIrows[i] == 0) {
      int[] uno = activateia(i+1);
      int rp1 = yTovictory();
      if (rp1 == 0) {
        position[uno[0]][uno[1]] = 0;
      } else if (rp1 != 0) {
        int[] dos = activatei(rp1);
        for (int g = 0; g <= 6; g ++) {
          int[] tres = activateia(g+1);
          int rp2 = yTovictory();
          if (rp2 == 0) {
            position[tres[0]][tres[1]] = 0;
          } else if (rp2 != 0) {
            int cuatro[] = activatei(rp2);
            int rp3 = yTovictory();
            if (rp3 == 0) {
            } else {
              scoring[i] += 30;
            }
            position[tres[0]][tres[1]] = 0;
            position[cuatro[0]][cuatro[1]] = 0;
          }
        }
        position[uno[0]][uno[1]] = 0;
        position[dos[0]][dos[1]] = 0;
      }
    }
  }
}
void LV8D() {
  refresh();
  //Third Layer.
  CheckAIbounds();
  for (int i = 0; i <= 6; i ++) {
    if (AIrows[i] == 0) {
      int[] uno = activatei(i+1);
      int rp1 = rTovictory();
      if (rp1 == 0) {
        position[uno[0]][uno[1]] = 0;
      } else if (rp1 != 0) {
        int[] dos = activateia(rp1);
        for (int g = 0; g <= 6; g ++) {
          int[] tres = activatei(g+1);
          int rp2 = rTovictory();
          if (rp2 == 0) {
            position[tres[0]][tres[1]] = 0;
          } else if (rp2 != 0) {
            int cuatro[] = activateia(rp2);
            int rp3 = rTovictory();
            if (rp3 == 0) {
            } else {
              scoring[i] += 900;
            }
            position[tres[0]][tres[1]] = 0;
            position[cuatro[0]][cuatro[1]] = 0;
          }
        }
        position[uno[0]][uno[1]] = 0;
        position[dos[0]][dos[1]] = 0;
      }
    }
  }
}