/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */
final int MANUAL_PAGES_COUNT = 8;

int manualPage = 1;

void drawManualPage() {
  text("Handleiding", width / 2, height / 30);
  
  Button prevPageButton = new Button(0, height - backButtonHeight, backButtonWidth, backButtonHeight, "-", PAGE_NONE);
  Button nextPageButton = new Button(width - backButtonWidth, height - backButtonHeight, backButtonWidth, backButtonHeight, "+", PAGE_NONE);
  
  // eerste afbeelding laten zien om de knoppen erover te tekenen
  showManual();
  
  if (manualPage < MANUAL_PAGES_COUNT) {
    nextPageButton.draw();
  }
  
  if (manualPage > 1) {
    prevPageButton.draw();
  }
  
  if (mousePressed) {
    if (nextPageButton.isClicked()) {
      if (manualPage < MANUAL_PAGES_COUNT) {
        manualPage++;
        return;
      }
    }
    
    if (prevPageButton.isClicked()) {
      if (manualPage > 1) {
        manualPage--;
        return;
      }
    }
  }
}

void showManual() {
  imageName = String.format("handleiding%d.jpg", manualPage);
  drawImage(imageName, width /7 , height / 20);
}
