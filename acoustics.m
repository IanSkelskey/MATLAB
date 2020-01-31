%m-File
% Modelling Acoustics in MATLAB
% Author: Ian Skelskey
% Date: 01/30/2020
 
% clear workspace, figure windows, and command window
clear all; close all; clc;
 
% define a vector of frequency values that is linearly spaced between 100
% Hz and 1500 Hz with 20 elements
f = linspace(100,1500,20);
 
% define variables
 
% tension: 150 N
T = 150;
% linear mass density: 0.02 kg/m
mu = 0.02;
% speed of sound in air: 343.5 m/s
v1 = 343.5;
% speed of sound in bar: 4000 m/s
v2 = 4000;
 
%outer radius: 0.0254 m
or = 0.0254;
%inner radius: 0.02 m
ir = 0.02;
 
%thickness of rectangular bar: 0.0175 m
bar = 0.0175;
 
 
 
% Equation 1: Solved for Length
% L = sqrt(T/mu)./(2*f)
% Equation 7: Solved for Length
% L = n*v1./(2*f);
% Equation 8: Solved for Length
% L = n*v1./(4*f);
% Equation 9: Solved for Length
% L = sqrt(m^2*pi*K*v2./(8*f));
 
% 7 Final Vectors
 
% set mode to 1 since we are concerned only with fundamental frequencies
n = 1;
 
% 1. String length (eq. 1) - a vector with different string length values 
%    for a string to produce the different fundamental frequency values,
 
L1 = sqrt(T/mu)./(2*f);
 
% 2. (wind) Tube length with two open ends (eq. 7) - a vector with 
%    different tube length values for a pipe with two open ends to produce 
%    the different fundamental frequency values,
 
L2 = n*v1./(2*f);
 
% 3. (wind) Tube length with one open end (eq. 8) -  a vector with 
%    different tube length values for a pipe with one open end to produce 
%    the different fundamental frequency values,
 
L3 = n*v1./(4*f);
 
% 4. (percussion) Tube length, simply supported (eq. 9) - a vector with 
%    different tube length values for a simply supported tube to produce the 
%    different fundamental frequency values,
 
% for simply supported beams, m = 3.0112 when n = 1
m = 3.0112;
 
%calculate K
K = sqrt((ir^2+or^2)/4);
 
L4 = sqrt(m^2*pi*K*v2./(8*f));
 
% 5. (percussion) Tube length, cantilevered (eq. 9) -  a vector with 
%    different tube length values for a cantilevered tube to produce the 
%    different fundamental frequency values,
 
% for cantilevered beams, m = 1.194 when n = 1
m = 1.194;
 
%calculate K
K = sqrt((ir^2+or^2)/4);
 
L5 = sqrt(m^2*pi*K*v2./(8*f));
 
% 6. (percussion) Bar length, simply supported (eq. 9)  - a vector with 
%    different bar length values for a simply supported rectangular bar to 
%    produce the different fundamental frequency values,
 
% for simply supported beams, m = 3.0112 when n = 1
m = 3.0112;
 
%calculate K
K = bar/3.46;
 
L6 = sqrt(m^2*pi*K*v2./(8*f));
 
% 7. (percussion) Bar length, cantilevered (eq. 9)  - a vector with 
%    different bar length values for a cantilevered rectangular bar to 
%    produce the different fundamental frequency values. 
 
% for cantilevered beams, m = 1.194 when n = 1
m = 1.194;
 
%calculate K
K = bar/3.46;
 
L7 = sqrt(m^2*pi*K*v2./(8*f));
 
%Plot Figures
 
figure
plot(f,L1)
xlabel('Frequency in Hz')
ylabel('String Length')
title('String Instruments')
 
figure
plot(f,L2,'m',f,L3,'k')
xlabel('Frequency in Hz')
ylabel('Pipe Length')
title('Pipe Instruments')
 
figure
plot(f,L4,'m',f,L5,'k',f,L6,'b',f,L7,'y')
xlabel('Frequency in Hz')
ylabel('Tube/Bar Length')
title('Percussion Instruments')
