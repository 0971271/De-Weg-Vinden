/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

void drawPowerUpsPage() {
  text("Power-ups", width / 2, height / 10);
  Button b1 = new Button(buttonX, buttonY, buttonWidth, buttonHeight, "t", -1);
  b1.draw();
  
  if (mousePressed && b1.isClicked()) {
    current = PAGE_MAIN;
  }
}
