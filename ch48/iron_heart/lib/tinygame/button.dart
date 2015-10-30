part of tinygame;

typedef void TinyButtonCallback(String id);

class TinyButton extends TinyDisplayObject {
  double w;
  double h;
  bool isTouch = false;
  bool isFocus = false;

  String buttonName;
  TinyColor bgcolorOff = new TinyColor.argb(0xaa, 0xff, 0xaa, 0xcc);
  TinyColor bgcolorOn = new TinyColor.argb(0xaa, 0xcc, 0xaa, 0xff);
  TinyColor bgcolorFocus = new TinyColor.argb(0xaa, 0xcc, 0xff, 0xaa);
  TinyButtonCallback onTouchCallback;
  TinyButton(this.buttonName, this.w, this.h, this.onTouchCallback) {}

  bool checkFocus(double x, double y) {
    if (x > 0 &&
        y > 0 &&
        y < h &&
        x < w) {
        return true;
    } else {
      return false;
    }
  }

  double px = 0.0;
  double py = 0.0;
  double prevGX=0.0;
  double prevGY=0.0;
  bool onTouch(TinyStage stage, int id, String type, double x, double y, double globalX, globalY) {
    switch(type) {
      case "pointerdown":
      if(checkFocus(x, y)) {
         isTouch = true;
         isFocus = true;
         prevGX = globalX;
         prevGY = globalY;
         px = 0.0;
         py = 0.0;
      }
      break;
      case "pointermove":
      if(checkFocus(x, y)) {
        isFocus = true;
        px += globalX-prevGX;
        py += globalY-prevGY;
        if(math.sqrt(px*px) > w || math.sqrt(py*py) > h) {
          isTouch = false;
          isFocus = false;
        }
      } else {
        isTouch = false;
        isFocus = false;
      }
      break;
      case "pointerup":
      if(isTouch == true && onTouchCallback != null) {
        new Future((){
          onTouchCallback(buttonName);
        });
      }
      isTouch = false;
      isFocus = false;
      break;
      default:
      isTouch = false;
      isFocus = false;
    }

    return false;
  }

  void onPaint(TinyStage stage, TinyCanvas canvas) {
    TinyPaint paint = new TinyPaint();
    if (isTouch) {
      paint.color = bgcolorOn;
      canvas.drawRect(stage, new TinyRect(0.0, 0.0, w, h), paint);
    } else if(isFocus) {
      paint.color = bgcolorFocus;
      canvas.drawRect(stage, new TinyRect(0.0, 0.0, w, h), paint);
    } else {
      paint.color = bgcolorOff;
      canvas.drawRect(stage, new TinyRect(0.0, 0.0, w, h), paint);
    }
  }
}
