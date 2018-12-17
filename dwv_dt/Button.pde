/**
 * Digitaal component voor 'De Weg Vinden'
 * Projectgroep 5
 */

class Button {
  private float x;
  private float y;
  private float width;
  private float height;
  private String text;
  private int page;
  private int c = BUTTON_COLOR;
  private int textColor = TEXT_COLOR;

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
   * @return boolean  true als er op de knop is geklikt, anders false
   */
  public boolean isClicked() {
    return (mouseX > this.x && this.x + this.width > mouseX) 
        && (mouseY > this.y && this.y + this.height > mouseY);
  }

  /**
   * Tekent de knop op het scherm.
   */
  public void draw() {
    drawButton(this.x, this.y, this.width, this.height, this.text, this.c, this.textColor);
  }
  
  /**
   * Krijg de paginanummer waar de knop naar leidt.
   *
   * @return int  de paginanummer
   */
  public int getPage() {
    return page;
  }
  
  /**
   * Verandert de pagina waar de knop naar leidt.
   *
   * @return De knop zelf.
   */
  public Button setPage(int page) {
    this.page = page;
    return this;
  }
  
  /**
   * Veranderd de kleur van de knop. (gebruik 'Button.draw()' om de verandering te zien)
   *
   * @return De knop zelf.
   */
  public Button setColor(int c) {
    this.c = c;
    return this;
  }
  
   /**
   * Veranderd de tekstkleur van de knop. (gebruik 'Button.draw()' om de verandering te zien)
   *
   * @return De knop zelf.
   */
  public Button setTextColor(int textColor) {
    this.textColor = textColor;
    return this;
  }
}
