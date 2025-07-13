int NumPantalla;
int contadorTiempo;
int posX;


PImage img1;
String Titulo1;
String text1;

PImage img2;
String text2;

PImage img3;
String text3;

PImage img4;
String text4;

PImage img5;

PFont fuente;

float movY;
float movX;
float velX;
//text2movimiento:
float movY2;
//text3movimiento:
float movX3;

void setup () {
  size (640, 480);

  NumPantalla = 0;
  contadorTiempo = 0;
  posX = -300;
  movX3 = -300;


  fuente = loadFont ("Constantia-25.vlw");
  img1 = loadImage ("Ithya1.jpg");
  Titulo1 = "ITHYA MAGIC STUDIES";
  text1 = "Ithya: Magic Studies es un juego lanzado el \n 7 de Mayo del 2025 por el artista, ilustrador \n y diseñador de videojuegos, BlueTurtle.";
  img2 = loadImage ("Ithya2.jpg");
  text2 = "Ithya Magic Studies es un adorable y cálido juego centrado \n centrado en la música, con fondos que nos recuerdan a los trabajos \n del Estudio Ghibli, y dejando a los jugadores interactuar con el fondo \n y alterar el tiempo del día.";
  img3 = loadImage ("Ithya3.jpg");
  text3 = "Tiene un rico mundo de fantasía listo para ser \n explorado que nos recuerdo a la Tierra Media \n del Señor de los Anillos pero con una ambientación \n mas similar a la Edad de Bronce.";
  img4 = loadImage ("Ithya4.jpg");
  text4 = "Pensado para ayudar al jugar a estudiar y realizar\n tareas, el juego incluye un diario \n para llevar rastro de las mismas, donde \nuno puede visualizarlas, añadir \n nuevas y finalizarlas.";
  img5 = loadImage ("Ithya5.jpg");

  if (NumPantalla == 2) {
    movY2= -100;
  }

  movX = width;
  movY = height;

  movY2= -100;
}

void draw () {
  background (255);
  textFont ( fuente );

  movX = movX+3;
  movX += velX;

  if (movX > 320) {
    movX = 320;
    movY -=1;
  }
  if (NumPantalla == 1 ) {
    //pantalla1
    image (img1, 0, 0, width, height);
    fill (0);
    textSize (1);
    textAlign (CENTER, CENTER);
    //titulo
    textFont ( fuente );
    textSize(28);
    text (Titulo1, width/2, 40);
    //cuerpo
    text (text1, width/2, movY);
  } else if (NumPantalla ==2) {
    //pantalla2
    image (img2, 0, 0, width, height);
    fill (255);
    textAlign (CENTER, CENTER);
    textFont ( fuente );
    textSize ( 17 );
    if (movY2 < height/2) {
      movY2 += 2;
    }

    text (text2, width/2, movY2);

    //pantalla3
  } else if (NumPantalla ==3) {
    image (img3, 0, 0, width, height );
    fill (255);
    textAlign (CENTER, CENTER);
    textSize (19);

    if (movX3 < 300) {
      movX3 += 4;
    }

    text (text3, movX3, 300);


    //pantalla4
  } else if (NumPantalla == 4) {
    image (img4, 0, 0, width, height);
    fill (230, 232, 178);
    text (text4, posX, 300);
    
    if (posX < 300) {
      posX += 5;
    }
    
    
    //pantalla5
  } else if (NumPantalla == 5) {
    image (img5, 0, 0, width, height);
    fill (0);
  }

  //BOTON DIBUJO
  if (NumPantalla == 5) {

    if (dist (320, 240, mouseX, mouseY) < 100) {
      fill (0);
    } else {
      fill (150);
    }
    
    rect (120, 80, 200, 200);
    fill (255);
    textAlign (CENTER, CENTER);
    text ("REINICIAR", 215, 170);
  }

contadorTiempo++;
if (contadorTiempo > 30 * 6 && NumPantalla < 5) {
  contadorTiempo = 0;
  NumPantalla++;

  // Reiniciá variables según la pantalla
  if (NumPantalla == 2) {
    movY2 = -100;
  } else if (NumPantalla == 3) {
    movX3 = -300;
  } else if (NumPantalla == 4) {
    posX = -300;
  }
}
    }
void mousePressed () {
  //BOTON DE REINICIO
  if (dist (320, 240, mouseX, mouseY) <100)
    //reiniciar todos los contadores y variables
    NumPantalla = 1;
  contadorTiempo = 0;
  movX = width + 10;
  movY = height;
  posX =-300;
  movX3 = -300;
  
}
