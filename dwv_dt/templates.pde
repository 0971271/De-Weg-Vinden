/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

void drawTemplatesPage() {
  text("Templates", width / 2, height / 10);
  text("Aantal Spelers", buttonX, buttonY + 25);

  Button pu1ButtonPlayer = new Button(buttonX + 100, buttonY, width / 12, buttonHeight, "2", PAGE_NONE);
  Button pu2ButtonPlayer = new Button(buttonX + 200, buttonY, width / 12, buttonHeight, "3", PAGE_NONE);
  Button pu3ButtonPlayer = new Button(buttonX + 300, buttonY, width / 12, buttonHeight, "4", PAGE_NONE);
   
  pu1ButtonPlayer.draw();
  pu2ButtonPlayer.draw();
  pu3ButtonPlayer.draw();
}
