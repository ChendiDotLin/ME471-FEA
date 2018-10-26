function[Nhat,DNhat] = Quad2DShapeFunctions(rvec,ShapeOrder)

r1 = rvec(1);
r2 = rvec(2);
Nhat = [(1-r1)*(1-r2)/4,(1+r1)*(1-r2)/4,(1+r1)*(1+r2)/4,(1-r1)*(1+r2)/4];
DNhat = 0.25*[-(1-r2),(1-r2),(1+r2),-(1+r2);-(1-r1),-(1+r1),(1+r1),(1-r1)];