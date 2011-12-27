class ScatterGraph {
  int xStartingPosition = 50;
  int xHeightFromEdgeOfWindow = height-40;
  int xFinishingPosition = (width-10);

  int yStartingPosition = 10;
  int yHeightFromEdgeOfWindow = 50;
  int yFinishingPosition = height-40;

  int textHeightForXAxis = height-30;
  int textHeightForXAxisLabel = height-15;

  int textWidthForYAxis = yHeightFromEdgeOfWindow-20;

  int xInterval;
  int yInterval;

  ArrayList<DataPoints> dataPoints;

  String yAxisLabel;
  String xAxisLabel;

  PFont axisFont;

  public ScatterGraph(String xAxisTitle, String yAxisTitle, ArrayList dataPoints, int xMax, int yMax, int xMin, int yMin) {
  }

  public ScatterGraph(ArrayList<DataPoints> dataPoints, int xInterval, int yInterval, String xAxisLabel, String yAxisLabel) {
    this.dataPoints = dataPoints;
    this.xInterval = xInterval;
    this.yInterval = yInterval;
    this.xAxisLabel = xAxisLabel;
    this.yAxisLabel = yAxisLabel;
    drawAxis();
    drawYAxisIntervals();
    drawXAxisIntervals();

    plotDataPoints();


    drawXAxisLabel();
    drawYAxisLabel();
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

  void drawXAxisIntervals() {
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

  void drawYAxisIntervals() {
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


  void drawYAxisLabel() {
    translate(xStartingPosition-40, (yStartingPosition+yFinishingPosition)/2);
    rotate(-HALF_PI);               // Rotate by theta
    textAlign(CENTER, CENTER);
    fill(0);
    axisFont = loadFont("ArialNarrow-10.vlw");
    textFont(axisFont,14); 
    text(xAxisLabel, 0, 0);
  }

  void drawXAxisLabel() {
    fill(0);
    textAlign(CENTER, CENTER);  
    axisFont = loadFont("ArialNarrow-10.vlw");
    textFont(axisFont, 14); 
    text(xAxisLabel, (xStartingPosition+xFinishingPosition)/2, textHeightForXAxisLabel);
  }
}

