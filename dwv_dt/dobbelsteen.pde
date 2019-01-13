/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 *
 * Giovanni Zwaan
 * Rahul Udaya
 * Lars Westerwoudt
 * Julian Valorian
 * Raymon van Veggel
 * Michael Zell
 */

String imageName = "";
boolean showImage = false;

void drawDicePage() {  
  text("Dobbelsteen", width / 2, height / 10);
  Button rollButton = new Button(0, height - buttonHeight * 2, width, buttonHeight * 2, "Gooi");
  rollButton.draw();
  
  if (mousePressed) {
    if (rollButton.isClicked()) {
      int rand = randomNumber(1, 6);
      imageName = String.format("dice_%d.jpg", rand);
      showImage = true;
    }
  }
  
  if (showImage) {
    drawImage(imageName, width / 4, height / 3, width / 2, height / 4);
  }
}
