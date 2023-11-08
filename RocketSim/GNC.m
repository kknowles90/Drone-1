clc; close all; clear;
format short

%creating system matrices according to Raytheon
A = [-1.064 1.000; 290.26 0];
B = [-0.25; -331.40];
C = [-123.34 0; 0.00 1.00];
D = [-13.51; 0];

%defining the names of states, inputs, and outputs for a system
states = {'AoA' , 'q'};
inputs = {'\delta_c'};
outputs = {'Az' , 'q'};

sys = ss(A,B,C,D,'statename',states,...
    'inputname',inputs,...
    'outputname',outputs);

%TF
TFs = tf(sys);
TF = TFs(2,1);
disp(pole(TF));

%LQR weight Matrices
Q = [0.1 0; 0 0.1];
R = 0.5;