/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

import java.util.Map;
import java.util.HashMap;
import java.security.SecureRandom;

// rgb kleuren maken door sd.'final int[] BACKGROUND_COLOR = {120, 37, 183}' te gebruiken
final int BACKGROUND_COLOR = 200;
final int TEXT_COLOR = 60;
final int BUTTON_COLOR = 128;

final int PAGE_NONE = 0;
final int PAGE_MAIN = 1;
final int PAGE_POWER_UPS = 2;
final int PAGE_DICE = 3;
final int PAGE_TEMPLATES = 4;
final int PAGE_MANUAL = 5;

// standaard knop eigenschappen
float buttonX;
float buttonY;
float buttonWidth;
float buttonHeight;

float backButtonX;
float backButtonY;
float backButtonWidth;
float backButtonHeight;
// TODO afbeelding van maken?
String backButtonText = "<-";

// tussenruimte (y-as)
float gap;

// start pagina
int current = PAGE_MAIN;
int prev = PAGE_NONE;

// eerste keer true voor het opstarten
boolean clicked = true;

Button[] navButtons;
Button backButton;

SecureRandom random;

// word aan het begin uitgevoerd
void setup() {
  size(700, 700);
  // fullScreen();
  noStroke();
  fill(0);
  textSize(18);
  // textSize(36);
  
  random = new SecureRandom();
  
  buttonX = width / 4;
  buttonY = height / 4;
  buttonWidth = width / 2;
  buttonHeight = height / 15;
  gap = height / 10;

  backButtonX = 0;
  backButtonY = 0;
  backButtonWidth = width / 10;
  backButtonHeight = height / 20;
  
  navButtons = new Button[4];
  
  Map<String, Integer> menuItems = new HashMap() {{
    put("Power-ups", PAGE_POWER_UPS);
    put("Dobbelsteen", PAGE_DICE);
    put("templates", PAGE_TEMPLATES);
    put("Handleiding", PAGE_MANUAL);
  }};
  
  int i = 0;
  
  for(Map.Entry<String, Integer> entry : menuItems.entrySet()) {
    String text = entry.getKey();
    int page = entry.getValue();
    navButtons[i] = new Button(buttonX, buttonY + (gap * i), buttonWidth, buttonHeight, text, page);
    i++;
  }
  
  backButton = new Button(backButtonX, backButtonY, backButtonWidth, backButtonHeight, backButtonText, PAGE_MAIN);
  p(String.format("Resolution: %dx%d", height, width));
}

/**
 * Wordt zelf aangeroepen.
 */
void draw() {
  // TODO dit gaat waarschijnlijk voor problemen zorgen bij het scrollen (bijvoorbeeld bij de pagina 'templates')
  // doe niks als het scherm nog wordt aangeraakt
  if (!clicked) {
    return;
  }
  
  // laat geen afbeeldingen zien als de pagina is veranderd
  if (showImage && prev != current) {
    imageName = "";
    showImage = false;
  }
  
  // maak de pagina 'leeg'
  background(BACKGROUND_COLOR);
  drawPage(current);
  
  if (hasBackButton()) {
    backButton.draw();
  }

  clicked = false;
}
/*
 * Wordt uitgevoerd wanneer er wordt losgelaten.
 */
void mousePressed() {
  if (clicked) {
    return;
  }
  
  if (current == PAGE_MAIN) {
    for (Button btn : navButtons) {
      if (btn.isClicked()) {
        current = btn.getPage();
        return;
      }
    }
  }
  
  if (hasBackButton()) {
    if (backButton.isClicked()) {
      current = backButton.getPage();
      return;
    }
  }
  
  clicked = true;
}

/**
 * Wordt uitgevoerd wanneer er wordt losgelaten.
 */
void mouseReleased() {
  if (clicked) {
    return;
  }
  
  clicked = true;
}

/**
 * Print tekst met de tijd erbij. (de naam 'print' is al bezet.)
 *
 * @param text  de tekst om te printen
 */
void p(String text) {
  String time = String.format("%02d:%02d:%02d", hour(), minute(), second());
  System.out.println(String.format("%s\t%s", time, text));
}

/**
 * Laat de opgevraagde pagina zien.
 *
 * @param page  de pagina dat getoond moet worden.
 */
void drawPage(int page) {
  if (page == PAGE_NONE) {
    return;
  }
  
  if (current != prev) {
    prev = current;
  }
  
  switch(page) {
    case PAGE_MAIN:
      drawMainMenu();
      break;
    case PAGE_POWER_UPS:
      drawPowerUpsPage();
      break;
    case PAGE_DICE:
      drawDicePage();
      break;
    case PAGE_TEMPLATES:
      drawTemplatesPage();
      break;
    case PAGE_MANUAL:
      drawManualPage();
      break;
    default:
      // onbekende pagina opgevraagd, laatste pagina laten staan?
      p(String.format("Onbekende paginanummer '%d'", page));
      break;
  }
}

/**
 * Tekent een knop op het scherm.
 *
 * @param x      positie op de x-as
 * @param y      positie op de y-as
 * @param w      breedte van de knop
 * @param h      hoogte van de knop
 * @param text   tekst van de knop, mag leeg zijn
 */
void drawButton(float x, float y, float w, float h, String text) {
  fill(BUTTON_COLOR);
  rect(x, y, w, h);
  
  if (text.length() > 0) {
    fill(TEXT_COLOR);
    textAlign(CENTER);
    text(text, x + (w / 2), y + (h / 2)); 
  }
}

/**
 * Tekent een afbeelding op het scherm.
 *
 * @param imageName  naam van de afbeelding 
 * @param x          positie op de x-as
 * @param y          positie op de y-as
 */
void drawImage(String imageName, float x, float y) {
  PImage image = loadImage(imageName);
  image(image, x, y);
}

/**
 * Tekent een afbeelding op het scherm en pas de grootte aan.
 *
 * @param name   naam van de afbeelding 
 * @param x      positie op de x-as
 * @param y      positie op de y-as
 * @param w      de breedte van de afbeelding
 * @param h      de hoogte van de afbeelding
 */
void drawImage(String name, float x, float y, int w, int h) {
  PImage image = loadImage(name);
  image(image, x, y);
  image.resize(w, h);
}

/**
 * Kijkt of de pagina een terugknop heeft.
 *
 * @return boolean  true als de pagina een terugknop heeft, anders false
 */
boolean hasBackButton() {
  return current != PAGE_MAIN;
}

/**
 * Krijg een random getal tussen 'min' en 'max'.
 *
 * @param min  hoe groot het getal minimaal mag zijn
 * @param max  hoe groot het getal maximaal mag zijn
 *
 * @return int  een random getal
 */
int randomNumber(int min, int max) {
  return random.nextInt(max - min + 1) + min;
}