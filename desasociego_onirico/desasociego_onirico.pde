import processing.sound.*; //importación de sonido 

SoundFile sonido; //sonido de las flores
SoundFile sonido1; //fase1 
SoundFile sonido2; //fase2
SoundFile sonido3;//fase3
//SoundFile sonido4;//feliz sueños 

// array de principio 
int inicioFrame1 = 0; // frame 0
PImage[] frames; // aquí están los frames y nombre del array 
int totalFrames = 6; // número de frames
boolean animaticI = false; // se comienza la animación (está activa) de array 1 

// array de fondo; fase 1
int frame2 = 0; 
PImage[] frames2; // nombre del array 
int totalFrames2 = 8; 
boolean animaticII = false; 

// final de sueño 
int frame3 = 0;
PImage[] sueño1; // nombre del array 
int sueñoFrames = 2; // número de frames
boolean animaticIII = false; 

// continuación de no dormir fase 2 
int frame4 = 0; 
PImage[] fase2; // nombre del array 
int totalFrames4 = 7; // número de frames
boolean animaticIIII = false; 

// array de valentía ES CUANDO DICE QUE SI = ñ 
int frame5 = 0; 
PImage[] flores; // nombre del array 
int totalFrames5 = 9; // número de frames
boolean animatic5 = false; 

void setup() {
  fullScreen();
  noCursor();
  
  // carga los frames de la animación 1
  frames = new PImage[totalFrames];
  for (int i = 0; i < totalFrames; i++) {
    String nombreImagen = "/assets/beta_1-" + (i + 1) + ".png"; // cambiar el nombre del archivo según tu convención
    frames[i] = loadImage(nombreImagen);  
  }
  
  // array 2 
  frames2 = new PImage[totalFrames2];
  for (int i = 0; i < totalFrames2; i++) {
    String nombreImagen = "/assets/beta_2-" + (i + 1) + ".png"; // cambiar el nombre del archivo según tu convención
    frames2[i] = loadImage(nombreImagen); 
  }

  // array FINAL sueño las almohadas  
  sueño1 = new PImage[sueñoFrames];
  for (int i = 0; i < sueñoFrames; i++) {
    String nombreImagen = "/assets/beta_3-" + (i + 1) + ".png"; 
    sueño1[i] = loadImage(nombreImagen); 
  }
   
  // array No sueño la fase 2 empieza lo negativo 
  fase2 = new PImage[totalFrames4]; 
  for (int i = 0; i < totalFrames4; i++) {
    String nombreImagen = "/assets/beta_4-" + (i + 1) + ".png";
    fase2[i] = loadImage(nombreImagen); 
  }
   
  // array de valentía, cuando dice que sí 
  flores = new PImage[totalFrames5]; 
  for (int i = 0; i < totalFrames5; i++) {
    String nombreImagen = "/assets/beta_5-" + (i + 1) + ".png";
    flores[i] = loadImage(nombreImagen); 
  }  

  // Carga los sonidos
  sonido = new SoundFile(this, "/assets/audio_beta0.mp3"); // sonido1 
  sonido1 = new SoundFile(this, "/assets/audio_beta1.mp3"); 
  sonido2 = new SoundFile(this, "/assets/audio_beta2.mp3"); // sonido2, debes tener este archivo en tu carpeta de assets
  sonido3 = new SoundFile(this, "/assets/audio_beta3.mp3"); 
  //sonido4 = new SoundFile(this, "/assets/audio_beta4.mp3"); // logro de dormir 
  
}

void draw()  {
  background(15);
  
  if (!animaticI && !animaticII && !animaticIII && !animaticIIII && !animatic5) {
    fill(255, 0, 0);
    textSize(70);
    textAlign(CENTER, CENTER);
    text("Presiona 's' para comenzar ", width / 2, height /3);
    text("y pulsa espacio para avanzar", width / 2, height /2 );  
}
  if (animaticI) {
    image(frames[inicioFrame1], 0, 0, width, height);
  } else if (animaticII) {
    image(frames2[frame2], 0, 0, width, height); 
  } else if (animaticIII) {
    image(sueño1[frame3], 0, 0, width, height); 
  } else if (animaticIIII) {
    image(fase2[frame4], 0, 0, width, height); 
  } else if (animatic5) {
    image(flores[frame5], 0, 0, width, height); 
  }
}

// para la activación por medio de la tecla
void keyPressed() {
  if (key == 's' && !animaticI && !animaticII && !animaticIII && !animaticIIII && !animatic5) {
    animaticI = true; // comienza la secuencia de imágenes 
    sonido1.play();
   
  } else if (key == 'e' && animaticI && inicioFrame1 == totalFrames - 1) { // fase 2 
    animaticII = true;
    animaticI = false; // detiene la animación I
    frame2 = 0; // reinicia el índice de la animación II
    inicioFrame1 = 0;
    sonido1.stop(); // Detiene el primer sonido
    sonido2.play(); // Reproduce el segundo sonido
  } else if (key == 'u' && animaticI && inicioFrame1 == totalFrames - 1) { // se pone el sueño de las almohadas 
    animaticIII = true;
    animaticI = false; // detiene la animación I
    frame3 = 0; // reinicia el índice de la animación III
    inicioFrame1 = 0;
    sonido1.stop(); // Asegura que el sonido se detenga antes de reproducirlo de nuevo
    //sonido4.play();
  } else if (key == 'o' && animaticII && frame2 == totalFrames2 - 1) { // fase 2 comienza después de animación II
    animaticIIII = true;
    animaticII = false; // detiene la animación II
    frame4 = 0; // reinicia el índice de la animación IV
    inicioFrame1 = 0;
    sonido2.stop(); // Detiene el segundo sonido
    sonido3.play();
  } else if (key == 'ñ' && animaticII && frame2 == totalFrames2 - 1) { // activa la animación 5 después de la animación II
    animatic5 = true;
    animaticII = false; // detiene la animación II
    frame5 = 0;
    inicioFrame1 = 0;// reinicia el índice de la animación V
    sonido2.stop();
    sonido.play();
    
  } else if (key == ' ' || key == 'r') {
    if (animaticI) {
      inicioFrame1++;
      if (inicioFrame1 >= totalFrames) {
        animaticI = false;
        inicioFrame1 = 0; // se reinicia
        sonido1.stop();
      }
    } else if (animaticII) {
      frame2++;
      if (frame2 >= totalFrames2) {
        animaticII = false; 
        frame2 = 0; // se reinicia
      } 
    } else if (animaticIII) {
      frame3++;
      if (frame3 >= sueñoFrames) {
        animaticIII = false; 
        frame3 = 0; // se reinicia
       // sonido4.stop();
      }
    } else if (animaticIIII) {
      frame4++;
      if (frame4 >= totalFrames4) {
        animaticIIII = false; 
        frame4 = 0; // se reinicia
         sonido3.stop();
      }
    } else if (animatic5) {
      frame5++;
      if (frame5 >= totalFrames5) {
        animatic5 = false; 
        frame5 = 0; // se reinicia
        sonido.stop();
      }
    }
  }

  // Si está en el último frame de fase2 y se presiona la tecla 'u', comienza sueño1
  if (key == 'u' && animaticIIII && frame4 == totalFrames4 - 1) {
    animaticIII = true;
    animaticIIII = false;
    frame3 = 0; // reinicia el índice de la animación III
     sonido3.stop();
     //sonido4.stop(); // Asegura que el sonido
  }
}
