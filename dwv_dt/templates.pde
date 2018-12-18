/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

final int OBSTAKELS_WEINIG = 1;
final int OBSTAKELS_NORMAAL = 2; 
final int OBSTAKELS_VEEL = 3;

final int FINISH_MIDDEN = 1;
final int FINISH_BOVEN = 2;
final int FINISH_HOEK = 3;

int aantalSpelers = 0;
int aantalObstakels = 0;  
int plaatsFinish = 0;

Button knopaantalPlayers2 = null;
Button knopaantalPlayers3 = null;
Button knopaantalPlayers4 = null;
Button knopaantalObstakelsweinig = null;
Button knopaantalObstakelsnormaal = null;
Button knopaantalObstakelsveel = null;
Button knopplaatsFinishmidden = null;
Button knopplaatsFinishboven = null;
Button knopplaatsFinishhoek = null;

void drawTemplatesPage() {
  text("Templates", width / 2, height / 10);

  text("Aantal Spelers", buttonX, buttonY + 25);

  if (knopaantalPlayers2 == null) {
    knopaantalPlayers2 = new Button(buttonX + 100, buttonY, width / 12, buttonHeight, "2");
    knopaantalPlayers3 = new Button(buttonX + 175, buttonY, width / 12, buttonHeight, "3");
    knopaantalPlayers4 = new Button(buttonX + 250, buttonY, width / 12, buttonHeight, "4");
    
    knopaantalObstakelsweinig = new Button(buttonX + 100, buttonY+75, width / 8, buttonHeight, "Weinig");
    knopaantalObstakelsnormaal = new Button(buttonX + 200, buttonY+75, width / 8, buttonHeight, "Normaal");
    knopaantalObstakelsveel = new Button(buttonX + 300, buttonY+75, width / 8, buttonHeight, "Veel");
    
    knopplaatsFinishmidden = new Button(buttonX + 100, buttonY+150, width / 6, buttonHeight, "Midden");
    knopplaatsFinishboven = new Button(buttonX + 225, buttonY+150, width / 6, buttonHeight, "Bovenkant");
    knopplaatsFinishhoek = new Button(buttonX + 350, buttonY+150, width / 6, buttonHeight, "Hoek");
  }

  knopaantalPlayers2.draw();
  knopaantalPlayers3.draw();
  knopaantalPlayers4.draw();

  text("Hoeveelheid Obstakels", buttonX -50, buttonY + 100);

  knopaantalObstakelsweinig.draw();
  knopaantalObstakelsnormaal.draw();
  knopaantalObstakelsveel.draw();

  text("Plek Finish", buttonX, buttonY + 175);

  knopplaatsFinishmidden.draw();
  knopplaatsFinishboven.draw();
  knopplaatsFinishhoek.draw();

  /**
   bij keuze van 3 knoppen afbeelding laten zien
   */
  //if (pu3ButtonPlayer.isClicked()) {
  //    int spelers = randomNumber(2,4);
  //   // int obstakels = randomNumber(5,7);
  //   // int Finish = randomNumber(8,10);
  //    imageName = String.format("bord_%d.jpeg", spelers);
  //    showImage = true;
  //  }
  if (mousePressed) {
    if (knopaantalPlayers2.isClicked()) {
      aantalSpelers = 2;
      knopaantalPlayers2.setColor(200);
    }
    if (knopaantalPlayers3.isClicked()) {
      aantalSpelers = 3;
    }
    if (knopaantalPlayers4.isClicked()) {
      aantalSpelers = 4;
    }
    if (knopaantalObstakelsweinig.isClicked()) {
      aantalObstakels = OBSTAKELS_WEINIG;
    }
    if (knopaantalObstakelsnormaal.isClicked()) {
      aantalObstakels = OBSTAKELS_NORMAAL;
    }
    if (knopaantalObstakelsveel.isClicked()) {
      aantalObstakels = OBSTAKELS_VEEL;
    }
    if (knopplaatsFinishmidden.isClicked()) {
      aantalObstakels = FINISH_MIDDEN;
    }
    if (knopplaatsFinishboven.isClicked()) {
      aantalObstakels = FINISH_BOVEN;
    }
    if (knopplaatsFinishhoek.isClicked()) {
      aantalObstakels = FINISH_HOEK;
    }
    if (aantalSpelers > 0 && aantalObstakels > 0 && plaatsFinish > 0) {
      imageName = String.format("bord-%d-%d-%d.jpeg", aantalSpelers, aantalObstakels, plaatsFinish);
      showImage = true;
    }
  }

  if (showImage) {
    drawImage(imageName, 400, 100, width-400, height-400);
  }
}
