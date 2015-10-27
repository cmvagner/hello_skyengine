part of tinygame;
abstract class TinyStage {
  double get x;
  double get y;
  double get w;
  double get h;
  bool animeIsStart = false;
  int animeId = 0;
  TinyDisplayObject _root;
  TinyDisplayObject get root => _root;
  TinyGameBuilder get builder;
  bool startable = false;
  bool isInit = false;

  void start();
  void stop();
  void markNeedsPaint();

  //
  //
  List<Matrix4> mats = [new Matrix4.identity()];

  pushMulMatrix(Matrix4 mat) {
    mats.add(mats.last*mat);
  }

  popMatrix() {
    mats.removeLast();
  }

  Matrix4 getMatrix() {
    return mats.last;
  }
}
