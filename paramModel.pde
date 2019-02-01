String p1 = "<flame name=\"output\" version=\"Apophysis 7x Version 15C.9\" size=\"954 934\" center=\"0 0\" scale=\"9.0\" oversample=\"1\" filter=\"0.2\" quality=\"1\" background=\"0 0 0\" brightness=\"4\" gamma=\"3.51\" gamma_threshold=\"0.01\" estimator_radius=\"9\" estimator_minimum=\"0\" estimator_curve=\"0.4\" enable_de=\"0\" plugins=\"\" new_linear=\"1\" curves=\"0 0 1 0 0 1 1 1 1 1 1 1 0 0 1 0 0 1 1 1 1 1 1 1 0 0 1 0 0 1 1 1 1 1 1 1 0 0 1 0 0 1 1 1 1 1 1 1\" >";
String p3 = "</flame>";
String p2 = "<xform weight=\"_WEIGHT_\" color=\"_COLOR_\" symmetry=\"-1\" square=\"1\" coefs=\"1 0 0 1 0 0\" post=\"_C00_ 0 0 _C11_ _C20_ _C21_\" opacity=\"1\" name=\"_NAME_\"/>";

String makeP2(int x0, int y0, int wd, int hd, float col, char name){
  String xform = p2;
  int weight = wd * hd;
  xform = xform.replace("_WEIGHT_", str(weight));
  xform = xform.replace("_COLOR_", str(col));
  xform = xform.replace("_NAME_", str(name));
  xform = xform.replace("_C00_", str(wd));
  xform = xform.replace("_C11_", str(hd));
  xform = xform.replace("_C20_", str(x0 + float(wd)/2));
  xform = xform.replace("_C21_", str(y0 + float(hd)/2)); //<>//
  return xform;
}
