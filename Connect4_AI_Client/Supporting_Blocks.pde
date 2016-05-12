int[] fmax(int[] a) {
  int max = a[0];
  int maxpos=0;
  for (int i = 0; i<=a.length-1; i++) {
    if (a[i]> max) {
      max = a[i];
      maxpos = i;
    }
  }
  int[] result = {maxpos, max};
  return result;
}
void keyReleased() {
  if (key == 'b') {
    position[undo[0]][undo[1]] = 0;
    fill(225, 225, 225);
    ellipse((width/7*undo[0])-(width/7)/2, height/6*(6-undo[1])+(height/6)/2, width/7, height/6);
    counter--;
  } else if (key == 'a') {
    if ( counter % 2 == 0) {
      AI();
    }
  }
}
void clearAImem() {
  for (int i = 0; i <= 6; i ++) {
    AIrows[i] = 0;
  }
}
void clearPAImem() {
  for (int i = 0; i <= 6; i ++) {
    PAIrows[i] = 0;
  }
}
int brain() {
  int pwinner = 0;
  for (int i = 0; i<=3; i++) {
    for (int g = 0; g <= 5; g++) {
      if (predictum[i+1][g+1] ==predictum[i+2][g+1] && predictum[i+3][g+1]==predictum[i+1][g+1]&&predictum[i+4][g+1]==predictum[i+1][g+1]&&predictum[i+1][g+1]==1) {
        pwinner = 1;
      } else if (predictum[i+1][g+1] ==predictum[i+2][g+1] && predictum[i+3][g+1]==predictum[i+1][g+1]&&predictum[i+4][g+1]==predictum[i+1][g+1]&&predictum[i+1][g+1]==2) {
        pwinner = 2;
      }
    }
    //Diagonal 
    for (int g = 0; g <=2; g++) {
      if (predictum[i+1][g+1]==predictum[i+2][g+2]&&predictum[i+2][g+2]==predictum[i+3][g+3]&&predictum[i+3][g+3]==predictum[i+4][g+4]&&predictum[i+3][g+3]==1) {
        pwinner = 1;
      } else if (predictum[i+1][g+1]==predictum[i+2][g+2]&&predictum[i+2][g+2]==predictum[i+3][g+3]&&predictum[i+3][g+3]==predictum[i+4][g+4]&&predictum[i+3][g+3]==2) {
        pwinner = 2;
      }
      if (predictum[7-i][g+1]==predictum[6-i][g+2]&&predictum[6-i][g+2]==predictum[5-i][g+3]&&predictum[5-i][g+3]==predictum[4-i][g+4]&&predictum[7-i][g+1]==1) {
        pwinner = 1;
      } else if (predictum[7-i][g+1]==predictum[6-i][g+2]&&predictum[6-i][g+2]==predictum[5-i][g+3]&&predictum[5-i][g+3]==predictum[4-i][g+4]&&predictum[7-i][g+1]==2) {
        pwinner = 2;
      }
    }
  }
  //Verticle
  for (int i = 0; i <=2; i++) {
    for (int g = 0; g <= 6; g++) {
      if (predictum[g+1][i+1]==predictum[g+1][i+2]&&predictum[g+1][i+2]==predictum[g+1][i+3]&&predictum[g+1][i+3]==predictum[g+1][i+4]&&predictum[g+1][i+4]==1) {
        pwinner = 1;
      } else if (predictum[g+1][i+1]==predictum[g+1][i+2]&&predictum[g+1][i+2]==predictum[g+1][i+3]&&predictum[g+1][i+3]==predictum[g+1][i+4]&&predictum[g+1][i+4]==2) {
        pwinner = 2;
      }
    }
  }
  return pwinner;
}
void Pactivateo(int x) {
  for (int i = 1; i <= 6; i++) {
    if (predictum[x][i] ==0) {
      predictum[x][i] = 2;
      break;
    }
  }
}

void refresh() {
  for (int i = 1; i <= 7; i++) {
    for (int g=1; g<=6; g++) {
      predictum[i][g]=position[i][g];
    }
  }
}
void CheckAIbounds() {
  for (int i = 1; i <= 7; i ++) {
    boolean outofbound = true;
    for (int q = 1; q <= 6; q ++) {
      if (predictum[i][q] == 0) {
        outofbound = false;
      }
    }
    if (outofbound == true) {
      PAIrows[i-1] = 1;
    }
  }
}
int[] activatei(int x) {
  int[] pos = {0, 0};
  for (int i = 1; i <= 6; i++) {
    if (position[x][i] ==0) {
      position[x][i] = 2;
      pos[0] = x;
      pos[1] = i;
      break;
    }
  }
  return pos;
}
int[] activateia(int x) {
  int[] pos = {0, 0};
  for (int i = 1; i <= 6; i++) {
    if (position[x][i] ==0) {
      position[x][i] = 1;
      pos[0] = x;
      pos[1] = i;
      break;
    }
  }
  return pos;
}
int rTovictory() {
  refresh();
  int activatum = 0;
  for (int i = 0; i <= 6; i ++) {
    refresh();
    if (AIrows[i]==0) {
      Pactivateo(i+1);
      int status = brain();
      if (status == 2) {
        return i+1;
      }
    }
  }
  return activatum;
}
int yTovictory() {
  refresh();
  int activatum = 0;
  for (int i = 0; i <= 6; i ++) {
    refresh();
    if (AIrows[i]==0) {
      Pactivate(i+1);
      int status = brain();
      if (status == 1) {
        return i+1;
      }
    }
  }
  return activatum;
}
void refreshscores() {
  for (int i = 0; i <= 6; i ++) {
    scoring[i] = 0;
  }
}