# -*- coding: utf-8 -*-
import sympy as sp
import scipy.integrate as integrate
import scipy.special as special
import matlab.engine

matlab.engine.start_matlab('-desktop -r "format short"')

from scipy.integrate import quad
from scipy.io import loadmat

x = loadmat('min_jerk_step.m')
sp.diff(3*x**2 +1, x)

from scipy.misc import derivative
def f(x):
    return 3*x**2 +1
"""
Created on Thu Apr  2 00:52:13 2020

@author: ezhan
"""
""" t:torque, i:inertia, a: acceleration """

def motor_command(I_model, theta):
    I_model = float(I_model)
    theta = float(theta)
    t = I_model * theta;
    return t    
def inverse_dynamics(a):
    def integrand (a):
            return a
    while (time<.3):
        torque = (final-initial)
        time += .01
def forward_dynamics():
    t = i * a;
    return t
def timeLoop(x, xd,xdd,goal,tau,dt):
    eng = matlab.engine.start_matlab()
    for i in range (0, tau/dt):
        x = eng.min_jerk_step(x,xd,xdd,goal,tau)
        print (eng.min_jerk_step(x,xd,xdd,goal,tau))
    return 0
print (timeLoop(45,3,1,90,.3,.01))
"""print("Input I_model")
I_model = input()
print("Input desired trajectory")
theta = input()
print (motor_command(I_model, theta))"""