import controlP5.*; // Cal importar la llibreria ControlP5 d'Andreas Schlegel des de "Sketch > Gestionar bibliotecas"
ControlP5 cp5; // Objecte de la llibreria ControlP5 que permet crear i gestionar els controls interactius (sliders, botons, etc.)

float F=1, V=200; // Paràmetres físics inicials: F = freqüència (Hz), V = velocitat (px/s)
float k, omega, lambda; // Paràmetres d'ona: nombre d'ona k, freqüència angular i longitud d'ona
float t = 0; // Temps de la simulació
float delta_t = 0.01; // Increment de temps per fer l'animació
float A = 25; // Amplitud de l'ona
float r = 5; // Mida de les partícules/punts (canviat de 10 a 5 per una visualització més còmoda)

boolean nom=false; // Control per veure el meu nom a la simulació (inicialitzat en false)

void setup() {
  size(1200, 600); // Mida de la finestra de treball
  
  cp5 = new ControlP5(this); // Inicialització de la llibreria de controls interactius (ControlP5)

  // Slider de freqüència
  cp5.addSlider("F")
     .setPosition((width/2)-400, 20) // Posició a la finestra de treball
     .setSize(200, 20) // Mida del slider
     .setRange(1, 10) // Rang de la freqüència (determinat segons l'enunciat)
     .setValue(1) // Valor inicial
     .setColorForeground(color(148, 0, 113)) // Color de la barra
     .setColorBackground(color(74, 0, 57)) // Color del fons de la barra
     .setColorActive(color(196, 0, 150)); // Color de la barra quan es mou (quan l'usuari passa el ratolí pel damunt, per fer-ho més interactiu)
  
  // Slider de velocitat
  cp5.addSlider("V")
     .setPosition((width/2)+120, 20) // Posició a la finestra de treball
     .setSize(200, 20) // Mida del slider
     .setRange(500, 1000) // Rang de la velocitat (determinat segons l'enunciat)
     .setValue(500) // Valor inicial
     .setColorForeground(color(148, 0, 113)) // Color de la barra
     .setColorBackground(color(74, 0, 57)) // Color del fons de la barra
     .setColorActive(color(196, 0, 150)); // Color de la barra quan es mou (quan l'usuari passa el ratolí pel damunt, per fer-ho més interactiu)
 
}

void draw() {
  background(0); // Neteja la pantalla per actualitzar l'animació
  
  // Si nom és true, es mostra el meu nom a la pantalla
  if(nom==true){
    mostrar_nom();
  }
  
  // Si nom és false, es mostra la simulació d'ones
  if(nom==false){
    lambda = V / F; // Longitud d'ona
    omega = 2*PI * F; // Freqüència angular
    k = 2*PI/ lambda; // Nombre d'ona
       
    t= t+delta_t; // Increment del temps
    // Trec t fora del for perquè volem calcular el temps global. Si no, estem fent que cada punt tingui un temps diferent
    // Utilitzo delta_t perquè és el que hi havia a l'enunciat de l'exercici, però potser seria més optimitzat fer t +=0.02
    
    int punts = width; // Nombre de partícules/punts a la pantalla
    
    // Recorrem la pantalla amb un for per construir les ones punt per punt
    for(int i = 0; i < punts; i += 6) // Canvio i=i+1 per i += 6 per reduir la densitat de punts
    {
      float x = i * 1.5; // Escala espacial per ajustar l'espai entre les partícules/punts de les ones
      
      // Càlcul de l'ona 1 (es propaga cap a la dreta)
      float ona1 = A * sin(-k * x + omega * t);
      float y1 = 100 + ona1 ;
      
      // Càlcul de l'ona 2 (es propaga cap a l'esquerra)
      float ona2 = A * sin(k * x + omega * t);
      float y2 = 300 + ona2;
      
      // Càlcul de la suma entre les ones 1 i 2 (genera una ona estacionària)
      float yT = 500 + (ona1 + ona2);
      
      noStroke();
      
      // Dibuixem les el·lipses de l'ona 1
      fill(170, 255, 0);
      ellipse(x, y1, r, r);
      
      // Dibuixem les el·lipses de l'ona 2
      fill(0, 255, 255);
      ellipse(x, y2, r, r);
      
      // Dibuixem les el·lipses de l'ona sumatòria
      fill(255, 154, 0);
      ellipse(x, yT, r, r);
    }
    
    dibuixaFletxes(); // Dibuixem les fletxes en la direcció de propagació de l'ona
  }  
}

void keyPressed() { 
  if (key == 32) { // El 32 és el codi ASCII de la tecla espai
    nom = !nom; // Si es fa així, al tornar a fer clic a ESPAI, es torna a veure l'animació (toggle)
  }
}

void mostrar_nom(){ 
  fill(149, 222, 216); // Color del rectangle en RGB
  rectMode(CENTER); // Perquè se centri bé
  rect(width/2, height/2, 400, 200); // Dibuix del rectangle de fons
  
  fill(3, 54, 49); // Color del text en RGB
  textAlign(CENTER, CENTER); // Per centrar el text
  textSize(30); // Mida del text
  text("Claudia Córdoba", width/2, height/2); // Es dibuixa el meu nom
}

void dibuixaFletxes() { // Fletxes de direcció

  float centre_x = width/2; // Centre horitzontal de la pantalla

  // Paràmetres de les fletxes i el text:
  stroke(255);
  strokeWeight(2);
  textSize(15);
  
  // Ona 1: cap a la dreta
  line(centre_x - 200, 150, centre_x + 200, 150); 
  dibuixaFletxaDreta(centre_x + 200, 150);
  textAlign(CENTER);
  fill(170, 255, 0);
  text("Ona 1", centre_x, 170);

  // Ona 2: cap a l'esquerra
  line(centre_x - 200, 350, centre_x + 200, 350);
  dibuixaFletxaEsquerra(centre_x - 200, 350);
  fill(0, 255, 255);
  text("Ona 2", centre_x, 370);

  // Ona sumatòria
  float ySuma = 500; // Posició vertical on es dibuixa la fletxa de la suma (per fer més fàcil de modificar el codi)
  
  line(centre_x, ySuma - 60, centre_x, ySuma + 60);
  dibuixaFletxaAmuntAvall(centre_x, ySuma);
  fill(255, 154, 0);
  text("Suma", centre_x, ySuma + 80);
}

void dibuixaFletxaDreta(float x, float y) { // Fletxa cap a la dreta
  line(x, y, x - 10, y - 10);
  line(x, y, x - 10, y + 10);
}

void dibuixaFletxaEsquerra(float x, float y) { // Fletxa cap a l'esquerra
  line(x, y, x + 10, y - 10);
  line(x, y, x + 10, y + 10);
}

void dibuixaFletxaAmuntAvall(float x, float y) { // Fletxa vertical (amunt i avall: ↕)
  float alçada = 60; // Alçada de la fletxa
  float midaPunta = 8; // Mida de les puntes
  
  // Punta superior:
  line(x, y - alçada, x - midaPunta, y - alçada + midaPunta);
  line(x, y - alçada, x + midaPunta, y - alçada + midaPunta);

  // Punta inferior:
  line(x, y + alçada, x - midaPunta, y + alçada - midaPunta);
  line(x, y + alçada, x + midaPunta, y + alçada - midaPunta);
}
