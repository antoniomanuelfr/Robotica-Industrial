import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation
from IPython.display import HTML 

def pcd(L1, L2, th1, th2):
   # Cuerpo de la función
    px=L1*np.cos(th1)+L2*np.cos(th1+th2)
    py=L1*np.sin(th1)+L2*np.sin(th1+th2)
    return np.c_[px.reshape(-1,1), py.reshape(-1,1)]

def robot(L1,th1,p, ax):
    x=[0, L1*np.cos(th1), p[0]]
    y=[0, L1*np.sin(th1), p[1]]
    ax.plot(x,y, color='k', linewidth=2)
    ax.axis([-2, 2, -2, 2])
    ax.set_aspect('equal')

def init():
    ax.clear() # Limpiamos los ejes actuales
    ax.set_xlabel('Eje X')
    ax.set_ylabel('Eje Y')
    ax.set_xlim(-2,2) # Establece los límites del eje x
    ax.set_ylim(-2,2) # y del eje y
    ax.set_aspect('equal') # Hace que la proporción de ambos ejes sea 1:1

def pintarPCD(i, L1, L2, Npuntos,ax):
    init()
    # Resto de código para elegir el punto actual (i), pintar la trayectoria hasta el punto actual y
    # pintar el robot en esa configuración. 
    #Código del ejercicio
    th1=np.arange(0, np.pi/2, np.pi/(2*Npuntos))
    th2=np.arange(0, np.pi/2, np.pi/(2*Npuntos))
    
    p = pcd(1,1,th1,th2)
    
    robot(1,th1[i], p[i],ax)
    ax.plot(p[:i,0], p[:i,1])

    N=30
fig, ax = plt.subplots()
anim = animation.FuncAnimation(fig, pintarPCD, frames = N, fargs = (1, 1, N, ax), interval = 30) 
HTML(anim.to_jshtml())