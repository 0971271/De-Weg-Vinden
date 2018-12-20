/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

void drawMainMenu() {
  textAlign(CENTER);
  text("De Weg Vinden", width / 2, height / 10);

  for (Button btn : navButtons) {
    btn.draw();
  }
  
  for (Button btn : navButtons) {
      if (btn.isClicked()) {
        current = btn.getPage();
        return;
      }
  }
}
