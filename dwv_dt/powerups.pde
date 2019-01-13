/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 *
 * Giovanni Zwaan
 * Rahul Udhaya
 * Lars Westerwoudt
 * Julian Valorian
 * Raymon van Veggel
 * Michael Zell
 */
 
void drawPowerUpsPage() {
   Button pu1Button = new Button(buttonX, buttonY, buttonWidth, buttonHeight, "Zwak");
   Button pu2Button = new Button(buttonX, buttonY + gap, buttonWidth, buttonHeight, "Medium");
   Button pu3Button = new Button(buttonX, buttonY + (gap * 2), buttonWidth, buttonHeight, "Sterk");
   pu1Button.draw();
   pu2Button.draw();
   pu3Button.draw();
   
  if (pu1Button.isClicked()) {
    int rand = randomNumber(1, 3);
    imageName = String.format("Power-up_%d.png", rand);

    if (!showImage) {
      showImage = true;
    }
  }
  else if (pu2Button.isClicked()) {
    int rand = randomNumber(4, 8);
    imageName = String.format("Power-up_%d.png", rand);
    
    if (!showImage) {
      showImage = true;
    }
  }
  else if (pu3Button.isClicked()) {
    int rand = randomNumber(9,13 );
    imageName = String.format("Power-up_%d.png", rand);

    if (!showImage) {
      showImage = true;
    }
  }
  
  if (showImage) {
    drawImage(imageName, width / 10, height / 10, Math.round(width * 0.8), Math.round(height * 0.07));
  }
}
