part of gragravity;

class Logic extends DisplayObject {
  @override
  String objectName = "logic";

  Logic() {
    PlanetWorld world = new PlanetWorld();
    child.add(world);
    world.child.add(new Particle());
   }

  void onTick(Stage stage, int timeStamp) {

  }
}
