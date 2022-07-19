clear;
close all;
clc;

% Load radar data
MIMO_FMCW = readmatrix('20211008_09.csv'); % 2.5m, 5.0m
I_fast_slow = squeeze(MIMO_FMCW(1:48, 1:2:480)); % i:j:k, "j" is increment % 48 * 240 matrix of Tx1~Tx3 I signal data
Q_fast_slow = squeeze(MIMO_FMCW(1:48, 2:2:480)); % 48 * 240 matrix of Tx1~Tx3 Q signal data
I_Q_fast_slow = [I_fast_slow + 1i * Q_fast_slow]; % complex matrix of beat signal

% Declare the variables
Range_max = 6.5; % in meters
Band_width = 3.4391 * 10^9;
c = 3e8; % speed of light
Range_resolution = c / (2 * Band_width);

Nd = 16 * 3 % the number of chirps % for Doppler Estimation including Tx1~Tx3 
Nr = 240 % the number of samples on each chirp

% Transpose I-Q signal Matrix for range-doppler map
I_Q_fast_slow = transpose(I_Q_fast_slow);