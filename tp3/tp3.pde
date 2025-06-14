//https://youtu.be/kcBZYQ9Dewg
PImage mitrabajo;
float angulo = 0;
boolean rotar = false;
boolean modoRandom = false; 

void setup() {
  size(800, 400);
  mitrabajo = loadImage ("imagendelcuadrado.jpg");
  mitrabajo.resize(400,400);
}
void draw() {
  background(255);
  image (mitrabajo,0,0);
  int tam = 29;
  noStroke();

  pushMatrix();
  translate(600 , 200);
  if (rotar) {
    angulo += 0.01;
  }
  rotate(angulo);
  translate(-200 , -200);

  // centro
  for (int i = 0; i < 14; i++) {
    if (modoRandom) {
      fill(random(255), random(255), random(255));
    } else {
      if (mousePressed) {
        if (i % 2 == 0) {
          fill(255);
        } else {
          fill(0);
        }
      } else {
        if (i % 2 == 0) {
          fill(0);
        } else {
          fill(255);
        }
      }

      if (i > 10 && i % 2 == 0) {
        if (mousePressed) {
          fill(0);
        } else {
          fill(255);
        }
      } else if (i > 10 && i < 14) {
        if (mousePressed) {
          fill(255);
        } else {
          fill(0);
        }
      }
    }

    rect(i * tam / 2, i * tam / 2, 400 - i * tam, 400 - i * tam);
  }

  // barras
  for (int i = 0; i < 12; i++) {
    if (modoRandom) {
      if (i % 3 == 0) {
    fill(214, 2, 112);
  } else if (i % 3 == 1) {
    fill(155, 79, 150); 
  } else {
    fill(0, 56, 168); 
  }
    } else {
      if (mousePressed) {
        if (i % 2 == 0) {
          fill(0);
        } else {
          fill(255);
        }
      } else {
        if (i % 2 == 0) {
          fill(255);
        } else {
          fill(0);
        }
      }
    }

    rect(160, i * tam / 2, 80, 16);
    rect(i * tam / 2, 160, 16, 80);
    rect(160, 385 - i * tam / 2, 80, 16);
    rect(385 - i * tam / 2, 160, 16, 80);
  }

  popMatrix();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    rotar = !rotar;
  }

  if (key == 'b' || key == 'B') {
    reiniciar();
  }

  if (key == 'd' || key == 'D') {
    modoRandom = !modoRandom; // 🟣 Activar/Desactivar colores random
  }
}

void reiniciar() {
  angulo = 0;
  rotar = false;
  modoRandom = false;
  return;
}
