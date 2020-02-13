% Modelling Acoustics in MATLAB
% Author: Ian Skelskey
% Date: 01/30/2020

% clear workspace, figure windows, and command window
clear all; close all; clc;

% define a vector of frequency values that is linearly spaced between
% 50 Hz & 270 Hz with 20 increments 
% These are the frequencies required for the two low voices
f = linspace(50,270,20);

% define variables

% tension: 
T1 = 20;
T2 = 40;
T3 = 60;
% linear mass density: 0.0318 kg/m
% mass density of a bass guitar E or A string
mu1 = 0.0318;
% mass density of a bass G/D string
mu2 = 0.0053;
% mass density of a guitar A String
mu3 = 0.0035;
% mass density of a guitar D String
mu4 = 0.00162;

% Reference #'s from Acoustics Activity

% Equation 1: Solved for Length
% L = sqrt(T/mu)./(2*f)
% Equation 7: Solved for Length
% L = n*v1./(2*f);
% Equation 8: Solved for Length
% L = n*v1./(4*f);
% Equation 9: Solved for Length
% L = sqrt(m^2*pi*K*v2./(8*f));

% set mode to 1 since we are concerned only with fundamental frequencies
n = 1;

% 1. String length (eq. 1) - a vector with different string length values 
%    for a string to produce the different fundamental frequency values,

L1 = sqrt(T1/mu1)./(2*f);
L2 = sqrt(T2/mu1)./(2*f);
L3 = sqrt(T3/mu1)./(2*f);

%Plot Figures

figure
plot(f,L1,'m',f,L2,'k',f,L3,'b')
xlabel('Frequency in Hz')
ylabel('String Length')
title('Bass E/A Strings of various tensions')
legend({'String 1: T = 20', 'String 2: T = 40', 'String 3: T = 60'},'Location','southwest')

% Fixed Length:
L = .35;

% Variable Tensions from 20N - 65N
T = linspace(20,65,20);

%BASSE/A
f = sqrt(T/mu1)/(2*L);
%BASSD/G
f2 = sqrt(T/mu2)/(2*L); 
%GUITAR A
f3 = sqrt(T/mu3)/(2*L); 
%GUITAR D
f4 = sqrt(T/mu4)/(2*L); 

figure
plot(T,f,'m', T, f2, 'b', T, f3, 'y', T, f4)
pbaspect([1 1 1])
xlabel('Tension (N)')
ylabel('Frequency (Hz)')
title('Bass Strings of Fixed Length (35 cm),& Variable Tension')
legend({'Bass E/A String)', 'Bass D/G String', 'Guitar A String','Guitar D String'},'Location','northwest')
