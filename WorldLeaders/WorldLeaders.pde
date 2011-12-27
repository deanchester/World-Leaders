void setup() {
  size(800, 800);

  ArrayList<DataPoints> dps = new ArrayList<DataPoints>();

  dps.add(new DataPoints(5, 20));
  dps.add(new DataPoints(10, 50));
  dps.add(new DataPoints(15, 80));
  dps.add(new DataPoints(20, 110));
  dps.add(new DataPoints(30, 100));

  println("creating scatter graph");
  ScatterGraph sg = new ScatterGraph(dps, 2, 5);
  smooth();
}

void loop() {
}

