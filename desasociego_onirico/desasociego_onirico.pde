//desasociego onirico
//import processing.sound; 
//SoundFile sound; 


int totalFrames = 3; // Número total de frames de la animación
int currentFrame = 0; // Frame actual
int frameWidth = 1920; // Ancho de cada frame
int frameHeight = 1080; // Alto de cada frame
PImage[] frames = new PImage[totalFrames]; // Array para almacenar los frames
boolean animationStarted = false; // Variable para controlar si la animación ha comenzado

void setup() {
  fullScreen();
  // carga los frames de la animación
  for (int i = 0; i < totalFrames; i++) {
    frames[i] = loadImage("beta_" + i + ".png"); // cambiar el nombre del archivo según tu convención
    frameRate(0.2);  
}
//sound = new SoundFile(this, "sound.wav");
}

void draw() {
  background(15);
  
  fill(255, 0, 0);
  textSize(80);
  text(" ¿Quieres escuchar? ", 100, 100);
  //los de width es  para la pocision del texto en medida mas no en pixeles
  
  // si la animación ha comenzado, muestra el frame actual
  if (animationStarted) {
    image(frames[currentFrame], (width - frameWidth) / 2, (height - frameHeight) / 2);
    // actualiza el frame actual para la próxima iteración
    currentFrame = (currentFrame + 1) % totalFrames;
  }
}
//para la activacion por medio de la tecla
void keyPressed() {
  // comienza la animación al presionar la tecla 'a'
  if (key == 'a') {
    animationStarted = true;
  }
}
