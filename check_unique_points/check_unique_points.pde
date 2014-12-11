

ArrayList<PVector> spotsPerm = new ArrayList<PVector>();
ArrayList<PVector> spotsTemp = new ArrayList<PVector>();


for (int i = 0; i < 5; i++) {
  PVector v = PVector.random2D();
  spotsPerm.add(v);
  spotsTemp.add(v);
}


while (!spotsTemp.isEmpty ()) {
  int index = int(random(spotsTemp.size()));
  println(spotsTemp.remove(index));
}
