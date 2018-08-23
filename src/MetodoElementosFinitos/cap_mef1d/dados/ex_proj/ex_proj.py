from __future__ import print_function, division
from fenics import *
import numpy as np
import matplotlib.pyplot as plt

# malha
mesh = IntervalMesh(4,0.25,0.75)

# espaco
V = FunctionSpace(mesh, 'P', 1)

# funcao
f = Expression('3*sin(2*pi*x[0])',element=V.ufl_element())
xx = IntervalMesh(100,0.25,0.75)
plot(f,mesh=xx,label="$f$")

# interpolacao
#Phf = Function(V)
x = SpatialCoordinate(mesh)
f = 3*sin(2*pi*x[0])
Phf = project(f, V)

# grafico
plot(Phf,mesh=mesh,
     marker='o',label="$P_h f$")
plt.legend(numpoints=1)
plt.grid('on')
plt.show()
