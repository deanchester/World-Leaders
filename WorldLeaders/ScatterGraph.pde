class ScatterGraph {
  int xStartingPosition = 30;
  int xHeightFromEdgeOfWindow = height-30;
  int xFinishingPosition = (width-10);

  int yStartingPosition = 10;
  int yHeightFromEdgeOfWindow = 30;
  int yFinishingPosition = height-30;

  ArrayList<DataPoints> dataPoints;


  public ScatterGraph(String xAxisTitle, String yAxisTitle, ArrayList dataPoints, int xMax, int yMax, int xMin, int yMin) {
  }

  public ScatterGraph(ArrayList<DataPoints> dataPoints) {
    this.dataPoints = dataPoints;
    drawAxis();
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
      println(dataPoints.get(i));
      float yPosition = map(dataPoints.get(i).getYValue(), getYMin(dataPoints), getYMax(dataPoints), yStartingPosition, yFinishingPosition);
      float xPosition = map(dataPoints.get(i).getXValue(), getXMin(dataPoints), getXMax(dataPoints), xStartingPosition, xFinishingPosition);

      println("New X Pos: " + xPosition);
      println("New Y Pos: " + yPosition);


      ellipse(xPosition, yPosition, 5, 5);
    }
  }
  
  
    public int getYMin(ArrayList<DataPoints> dataPoints) {
    DataPoints dp = dataPoints.get(0);
    int minValue = dp.getYValue(); 
    println("Y value at: " + minValue);
    for (int i=1;i < dataPoints.size();i++) {  
      DataPoints dp2 = dataPoints.get(i);
      if (dp2.getYValue() < minValue) {  
        minValue = dp2.getYValue();
      }
    }  
    println("Min Y Value: " + minValue);
    return minValue;
  }

  public int getYMax(ArrayList<DataPoints> dataPoints) {

    DataPoints dp = dataPoints.get(0);
    int maxValue = dp.getYValue();  
    for (int i=1;i < dataPoints.size();i++) {  
      DataPoints dp2 = dataPoints.get(i);
      if (dp2.getYValue() > maxValue) {  
        maxValue = dp2.getYValue();
      }
    }  

    println("Max Y Value: " + maxValue);
    return maxValue;
  }

  public int getXMin(ArrayList<DataPoints> dataPoints) {

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

  public int getXMax(ArrayList<DataPoints> dataPoints) {

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

}

