clc;
close all;
clear;
format short

% Creating system matrices according to Raytheon
A = [-1.064 1.000; 290.26 0];
B = [-0.25; -331.40];
C = [-123.34 0; 0.00 1.00];
D = [-13.51; 0];

% Defining the names of states, inputs, and outputs for a system
states = {'AoA', 'q'};       % Names of the states
inputs = {'\delta_c'};       % Name of the input
outputs = {'Az', 'q'};       % Names of the outputs

% Create a state-space (ss) model using the system matrices and specifying
% state, input, and output names.
sys = ss(A, B, C, D, 'statename', states, 'inputname', inputs, 'outputname', outputs);

% Transfer function
TFs = tf(sys);                % Convert the state-space model to transfer functions
TF = TFs(2);                  % Accessing the second transfer function

% Display the poles of the transfer function
disp(pole(TF));