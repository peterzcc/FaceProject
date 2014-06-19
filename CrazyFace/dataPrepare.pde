






//_________________________________________________________________________


  int inPolyCheck(float x, float y,PVector[] z) {
    float a = 0;
    PVector v = new PVector(x, y);
    for (int i =0; i<z.length-1; i++) {
      PVector v1 = z[i].get();
      PVector v2 = z[i+1].get();
      a += vAtan2cent180(v, v1, v2);
    }
    PVector v1 = z[z.length-1].get();
    PVector v2 = z[0].get();
    a += vAtan2cent180(v, v1, v2);

    if (abs(abs(a) - TWO_PI) < 0.01) return 1;
    else return 0;
  }
float vAtan2cent180(PVector cent, PVector v2, PVector v1) {
    PVector vA = v1.get();
    PVector vB = v2.get();
    vA.sub(cent);
    vB.sub(cent);
    vB.mult(-1);
    float ang = atan2(vB.x, vB.y) - atan2(vA.x, vA.y);
    if (ang < 0) ang = TWO_PI + ang;
    ang-=PI;
    return ang;
  }

