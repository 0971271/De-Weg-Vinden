/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */
 
Button nextPageButton = null;
Button prevPageButton = null;
 
int manualPage = 1;

void drawManualPage() {
  text("Handleiding", width / 2, height / 10);
  
  if (nextPageButton == null) {
    // 0, buttonY + (gap * 6.3), width, buttonHeight * 2
    prevPageButton = new Button(0, height - backButtonHeight, backButtonWidth, backButtonHeight, "-", PAGE_NONE);
    nextPageButton = new Button(width - backButtonWidth, height - backButtonHeight, backButtonWidth, backButtonHeight, "+", PAGE_NONE);
  }
  
  // eerste afbeelding laten zien om de knoppen erover te tekenen
  showManual();
  
  if (manualPage < 3) {
    nextPageButton.draw();
  }
  
  if (manualPage > 1) {
    prevPageButton.draw();
  }
  
  if (mousePressed) {
    if (nextPageButton.isClicked()) {
      if (manualPage < 3) {
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
  imageName = String.format("handleiding-%d.png", manualPage);
  drawImage(imageName, 0, 0, 100, 100);
  p(String.format("%d %s", manualPage, imageName));
}
