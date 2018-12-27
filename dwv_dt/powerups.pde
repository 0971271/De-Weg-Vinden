/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */
 
void drawPowerUpsPage() {
   Button pu1Button = new Button(buttonX, buttonY, buttonWidth, buttonHeight, "Zwak", -1);
   Button pu2Button = new Button(buttonX, buttonY + gap, buttonWidth, buttonHeight, "Medium", -1);
   Button pu3Button = new Button(buttonX, buttonY + (gap * 2), buttonWidth, buttonHeight, "Sterk", -1);
   pu1Button.draw();
   pu2Button.draw();
   pu3Button.draw();
   
   if (mousePressed) {
    if (pu1Button.isClicked()) {
      int rand = randomNumber(1, 3);
      imageName = String.format("Power-up_%d.png", rand);
      showImage = true;
    }
  
    if (pu2Button.isClicked()) {
      int rand = randomNumber(4, 8);
      imageName = String.format("Power-up_%d.png", rand);
      showImage = true;
    }

    if (pu3Button.isClicked()) {
      int rand = randomNumber(9,13 );
      imageName = String.format("Power-up_%d.png", rand);
      showImage = true;
    }
  }
  
  if (showImage) {
    drawImage(imageName, width/10, height/10);
  }
}
