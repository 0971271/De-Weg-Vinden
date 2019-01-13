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

class Button {
  private float x;
  private float y;
  private float width;
  private float height;
  private String text;
  private int page;
  private color backgroundColor = BUTTON_COLOR;
  private color textColor = TEXT_COLOR;
  private boolean visible = false;

  public Button(float x, float y, float w, float h, String text, int page) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = h;
    this.text = text;
    this.page = page;
  }
  
  public Button(float x, float y, float w, float h, String text) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = h;
    this.text = text;
    this.page = PAGE_NONE;
  }

  /**
   * Kijkt of er op de knop is geklikt.
   *
   * @return  true als er op de knop is geklikt, anders false
   */
  public boolean isClicked() {
    return mousePressed 
        && this.visible
        && (mouseX > this.x && this.x + this.width > mouseX) 
        && (mouseY > this.y && this.y + this.height > mouseY);
  }

  /**
   * Tekent de knop op het scherm.
   */
  public void draw() {
    if (!this.visible) {
      this.visible = true;
    }
    
    fill(this.backgroundColor);
    rect(this.x, this.y, this.width, this.height);
  
    if (this.text.length() > 0) {
      fill(this.textColor);
      textAlign(CENTER);
      text(this.text, this.x + (this.width / 2), this.y + (this.height / 2)); 
    }
  }
  
  /**
   * Krijg de paginanummer waar de knop naar leidt.
   *
   * @return  de paginanummer
   */
  public int getPage() {
    return page;
  }
  
  /**
   * Verandert de pagina waar de knop naar leidt.
   *
   * @param page  de nieuwe pagina waar de knop naar leidt
   *
   * @return  De knop zelf.
   */
  public Button setPage(int page) {
    this.page = page;
    return this;
  }
  
  /**
   * Veranderd de kleur van de knop. (gebruik 'Button.draw()' om de verandering te zien)
   *
   * @param backgroundColor  de nieuwe achtergrondkleur van de knop
   *
   * @return  De knop zelf.
   */
  public Button setColor(color backgroundColor) {
    this.backgroundColor = backgroundColor;
    return this;
  }
  
   /**
   * Veranderd de tekstkleur van de knop. (gebruik 'Button.draw()' om de verandering te zien)
   *
   *
   * @param textColor  de nieuwe tekstkleur van de knop
   * @return  De knop zelf.
   */
  public Button setTextColor(color textColor) {
    this.textColor = textColor;
    return this;
  }
}
