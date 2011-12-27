class DataPoints {
  private int x;
  private int y; 

  public DataPoints(int x, int y) {
    this.x = x;
    this.y = y;
  } 

  public int getXValue() {
    return x;
  }

  public int getYValue() {
    return y;
  }

  public String toString() {
    return "X: " + x + " Y: " +y;
  }
}

