void setup() {
  size(400, 400, P3D);

  ArrayList<DataPoints> dps = new ArrayList<DataPoints>();

  dps.add(new DataPoints(3, 20));
  dps.add(new DataPoints(10, 50));
  dps.add(new DataPoints(15, 70));
  ScatterGraph sg = new ScatterGraph(dps);
}

void loop() {
}

