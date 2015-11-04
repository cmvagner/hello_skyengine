import 'dart:html';
import 'dart:web_gl';
import 'package:ch48/tinygame.dart';
import 'package:ch48/tinygame_webgl.dart';

void main() {
  print("--------1-dart hello ( 1 )");
 // TinyGameBuilderForWebgl gl = new TinyGameBuilderForWebgl();
 // TinyStage stage = gl.createStage(new TinyGameRoot(400.0, 400.0));
 // stage.start();
  test();
  print("--------1-dart hello ( 2 ) ");
}

void test() {
  TinyWebglContext c = new TinyWebglContext();
  RenderingContext gl = c.GL;
  TinyWebglCanvas canvas = new TinyWebglCanvas(c);
  TinyPaint p = new TinyPaint();
  p.color = new TinyColor.argb(0xff, 0xff, 0xff, 0x00);
  canvas.drawRect(null, new TinyRect(50.50,0.0,100.0,100.0), p);
  p.color = new TinyColor.argb(0xff, 0x00, 0xff, 0xff);
  canvas.drawRect(null, new TinyRect(150.150,0.0,100.0,100.0), p);
}