class ScatterGraph {
  int xStartingPosition = 30;
  int xHeightFromEdgeOfWindow = height-30;
  int xFinishingPosition = (width-10);

  int yStartingPosition = 10;
  int yHeightFromEdgeOfWindow = 30;
  int yFinishingPosition = height-30;

  int textHeightForXAxis = height-20;
  int textWidthForYAxis = yHeightFromEdgeOfWindow-20;

  int xInterval;
  int yInterval;

  ArrayList<DataPoints> dataPoints;

  PFont axisFont;

  public ScatterGraph(String xAxisTitle, String yAxisTitle, ArrayList dataPoints, int xMax, int yMax, int xMin, int yMin) {
  }

  public ScatterGraph(ArrayList<DataPoints> dataPoints, int xInterval, int yInterval) {
    this.dataPoints = dataPoints;
    this.xInterval = xInterval;
    this.yInterval = yInterval;
    drawAxis();
    println("Drawing Labels");
    drawXAxisLabels();
    drawYAxisLabels();
    plotDataPoints();
  } 


  /**
   This method draws the axis for the graph. It uses dynamic sizing depending on the window size. 
   */
  void drawAxis() {
    //X-Axis
    line(xStartingPosition, xHeightFromEdgeOfWindow, xFinishingPosition, xHeightFromEdgeOfWindow);

    //Y-Axis
    line(yHeightFromEdgeOfWindow, yStartingPosition, yHeightFromEdgeOfWindow, yFinishingPosition);
  } 

  void plotDataPoints() {
    for (int i = 0;i<dataPoints.size();i++) { 
      float yPosition = map(dataPoints.get(i).getYValue(), getYMin(dataPoints), getYMax(dataPoints), yFinishingPosition, yStartingPosition);
      float xPosition = map(dataPoints.get(i).getXValue(), getXMin(dataPoints), getXMax(dataPoints), xStartingPosition, xFinishingPosition);

      ellipse(xPosition, yPosition, 10, 10);
      //point(xPosition, yPosition);
    }
  }


  private int getYMin(ArrayList<DataPoints> dataPoints) {
    DataPoints dp = dataPoints.get(0);
    int minValue = dp.getYValue(); 
    for (int i=1;i < dataPoints.size();i++) {  
      DataPoints dp2 = dataPoints.get(i);
      if (dp2.getYValue() < minValue) {  
        minValue = dp2.getYValue();
      }
    }  
    return minValue;
  }

  private int getYMax(ArrayList<DataPoints> dataPoints) {

    DataPoints dp = dataPoints.get(0);
    int maxValue = dp.getYValue();  
    for (int i=1;i < dataPoints.size();i++) {  
      DataPoints dp2 = dataPoints.get(i);
      if (dp2.getYValue() > maxValue) {  
        maxValue = dp2.getYValue();
      }
    }  

    return maxValue;
  }

  private int getXMin(ArrayList<DataPoints> dataPoints) {

    DataPoints dp = dataPoints.get(0);
    int minValue = dp.getXValue();  
    for (int i=1; i < dataPoints.size(); i++) {  
      DataPoints dp2 = dataPoints.get(i);
      if (dp2.getXValue() < minValue) {  
        minValue = dp2.getXValue();
      }
    }
    return minValue;
  }

  private int getXMax(ArrayList<DataPoints> dataPoints) {

    DataPoints dp = dataPoints.get(0);
    int maxValue = dp.getXValue();  

    for (int i=1; i < dataPoints.size(); i++) {  
      DataPoints dp2 = dataPoints.get(i);
      if (dp2.getXValue() > maxValue) {  
        maxValue = dp2.getXValue();
      }
    }    
    return maxValue;
  }

 void drawXAxisLabels() {
    fill(0);
    textAlign(CENTER, TOP);  
    axisFont = loadFont("ArialNarrow-10.vlw");
    textFont(axisFont); 

    stroke(224);
    strokeWeight(1);

    for (int i = getXMin(dataPoints); i < getXMax(dataPoints); i++) {
      if (i % xInterval == 0) {
        float textPosition = map(i, getXMin(dataPoints), getXMax(dataPoints), xStartingPosition, xFinishingPosition);
        text(i, textPosition, textHeightForXAxis);
        line(textPosition, yStartingPosition, textPosition, yFinishingPosition-1);
      }
    }
  }

  void drawYAxisLabels() {
    fill(0);
    textAlign(CENTER, CENTER);  
    axisFont = loadFont("ArialNarrow-10.vlw");
    textFont(axisFont); 
    
    stroke(224);
    strokeWeight(1);

    
    for (int i = getYMax(dataPoints); i > getYMin(dataPoints); i--) {
      if (i % yInterval == 0) {
        float textPosition = map(i, getYMin(dataPoints), getYMax(dataPoints), yFinishingPosition, yStartingPosition);
        text(i, textWidthForYAxis, textPosition);
        line(xStartingPosition+1, textPosition, xFinishingPosition, textPosition);
      }
    }
  }
}

