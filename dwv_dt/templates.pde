/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

final color KNOP_KLIK_KLEUR = #72878a;

final int OBSTAKELS_WEINIG = 1;
final int OBSTAKELS_NORMAAL = 2; 
final int OBSTAKELS_VEEL = 3;

final int FINISH_MIDDEN = 1;
final int FINISH_BOVEN = 2;
final int FINISH_HOEK = 3;

int aantalSpelers = 0;
int aantalObstakels = 0;  
int plaatsFinish = 0;

Button knopaantalPlayers2;
Button knopaantalPlayers3;
Button knopaantalPlayers4;
Button knopaantalObstakelsweinig;
Button knopaantalObstakelsnormaal;
Button knopaantalObstakelsveel;
Button knopplaatsFinishmidden;
Button knopplaatsFinishboven;
Button knopplaatsFinishhoek;

// eerste keer true
boolean resetTemplate = true;

void drawTemplatesPage() {
  text("Templates", width / 2, height / 10);

  if (resetTemplate) {
    knopaantalPlayers2 = new Button(buttonX + (width / 7), buttonY - (height / 8), width / 12, buttonHeight, "2");
    knopaantalPlayers3 = new Button(buttonX + (width / 7) + (width / 10), buttonY - (height / 8), width / 12, buttonHeight, "3");
    knopaantalPlayers4 = new Button(buttonX + (width / 7) + ((width / 10) * 2), buttonY - (height / 8), width / 12, buttonHeight, "4");
    
    knopaantalObstakelsweinig = new Button(buttonX + ((width / 7)), buttonY, width / 7, buttonHeight, "Weinig");
    knopaantalObstakelsnormaal = new Button(buttonX + ((width / 7) * 2.2), buttonY, width / 7, buttonHeight, "Normaal");
    knopaantalObstakelsveel = new Button(buttonX + ((width / 7) * 3.4), buttonY, width / 7, buttonHeight, "Veel");
    
    knopplaatsFinishmidden = new Button(buttonX + (width / 7), buttonY + (height / 8), width / 6, buttonHeight, "Midden");
    knopplaatsFinishboven = new Button(buttonX + ((width / 7) * 2.2), buttonY + (height / 8), width / 6, buttonHeight, "Bovenkant");
    knopplaatsFinishhoek = new Button(buttonX + ((width / 7) * 3.4), buttonY + (height / 8), width / 6, buttonHeight, "Hoek");

    resetTemplate = false;
  }

  text("Aantal Spelers", buttonX, buttonY - (height / 8) + (buttonHeight / 2));
  knopaantalPlayers2.draw();
  knopaantalPlayers3.draw();
  knopaantalPlayers4.draw();

  text("Hoeveelheid Obstakels", buttonX - 50, buttonY + (buttonHeight / 2));
  knopaantalObstakelsweinig.draw();
  knopaantalObstakelsnormaal.draw();
  knopaantalObstakelsveel.draw();

  text("Plek Finish", buttonX, buttonY + (height / 8) + (buttonHeight / 2));
  knopplaatsFinishmidden.draw();
  knopplaatsFinishboven.draw();
  knopplaatsFinishhoek.draw();

  // als een knop van een groep is geklikt is verder kijken onnodig
  // aantal spelers
  if (knopaantalPlayers2.isClicked()) {
    aantalSpelers = 2;
    knopaantalPlayers2.setColor(KNOP_KLIK_KLEUR);

    knopaantalPlayers3.setColor(BUTTON_COLOR);
    knopaantalPlayers4.setColor(BUTTON_COLOR);
  }
  else if (knopaantalPlayers3.isClicked()) {
    aantalSpelers = 3;
    knopaantalPlayers3.setColor(KNOP_KLIK_KLEUR);

    knopaantalPlayers2.setColor(BUTTON_COLOR);
    knopaantalPlayers4.setColor(BUTTON_COLOR);
  }
  else if (knopaantalPlayers4.isClicked()) {
    aantalSpelers = 4;
    knopaantalPlayers4.setColor(KNOP_KLIK_KLEUR);

    knopaantalPlayers2.setColor(BUTTON_COLOR);
    knopaantalPlayers3.setColor(BUTTON_COLOR);
  }

  // aantal obstakels
  if (knopaantalObstakelsweinig.isClicked()) {
    aantalObstakels = OBSTAKELS_WEINIG;
    knopaantalObstakelsweinig.setColor(KNOP_KLIK_KLEUR);

    knopaantalObstakelsnormaal.setColor(BUTTON_COLOR);
    knopaantalObstakelsveel.setColor(BUTTON_COLOR);
  }
  else if (knopaantalObstakelsnormaal.isClicked()) {
    aantalObstakels = OBSTAKELS_NORMAAL;
    knopaantalObstakelsnormaal.setColor(KNOP_KLIK_KLEUR);

    knopaantalObstakelsweinig.setColor(BUTTON_COLOR);
    knopaantalObstakelsveel.setColor(BUTTON_COLOR);
  }
  else if (knopaantalObstakelsveel.isClicked()) {
    aantalObstakels = OBSTAKELS_VEEL;
    knopaantalObstakelsveel.setColor(KNOP_KLIK_KLEUR);
    
    knopaantalObstakelsweinig.setColor(BUTTON_COLOR);
    knopaantalObstakelsnormaal.setColor(BUTTON_COLOR);
  }

  // plek finish
  if (knopplaatsFinishmidden.isClicked()) {
    plaatsFinish = FINISH_MIDDEN;
    knopplaatsFinishmidden.setColor(KNOP_KLIK_KLEUR);

    knopplaatsFinishboven.setColor(BUTTON_COLOR);
    knopplaatsFinishhoek.setColor(BUTTON_COLOR);
  }
  else if (knopplaatsFinishboven.isClicked()) {
    plaatsFinish = FINISH_BOVEN;
    knopplaatsFinishboven.setColor(KNOP_KLIK_KLEUR);

    knopplaatsFinishmidden.setColor(BUTTON_COLOR);
    knopplaatsFinishhoek.setColor(BUTTON_COLOR);
  }
  else if (knopplaatsFinishhoek.isClicked()) {
    plaatsFinish = FINISH_HOEK;
    knopplaatsFinishhoek.setColor(KNOP_KLIK_KLEUR);

    knopplaatsFinishmidden.setColor(BUTTON_COLOR);
    knopplaatsFinishboven.setColor(BUTTON_COLOR);
  }
  
  if (aantalSpelers > 0 && aantalObstakels > 0 && plaatsFinish > 0) {
    imageName = String.format("bord-%d-%d-%d.jpg", aantalSpelers, aantalObstakels, plaatsFinish);
    showImage = true;
  }

  if (showImage) {
    drawImage(imageName, width / 10, height * 0.48, Math.round(width * 0.8), Math.round(height * 0.48));
  }
}
