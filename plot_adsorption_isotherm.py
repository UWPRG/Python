# This is Jim's example code for making a plot of an adsorption isotherm

import matplotlib.pyplot as pyplot
import numpy as np
xmin=0
xmax=2.5
K=10
n=2
x=np.linspace(xmin,xmax,50, endpoint=True)
y=np.divide(K*np.power(x,n),(1+K*np.power(x,n)))
pyplot.plot(x,y)
pyplot.axis([xmin,xmax,0,2])
pyplot.show()
