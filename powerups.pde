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
      int rand = randomNumber(1, 2);
      imageName = String.format("dice_%d.jpg", rand);
      showImage = true;
    }
  
    if (pu2Button.isClicked()) {
      int rand = randomNumber(3, 4);
      imageName = String.format("dice_%d.jpg", rand);
      showImage = true;
    }

    if (pu3Button.isClicked()) {
      int rand = randomNumber(5, 6);
      imageName = String.format("dice_%d.jpg", rand);
      showImage = true;
    }
  }
  
  if (showImage) {
    drawImage(imageName, 0, 0);
  }
   
   
}
