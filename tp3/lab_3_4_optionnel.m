% 3.4 Optionnel
clear;clc;close all;

load("guitare.mat");
mg = music;
load("piano.mat");
mp = music;


figure;
H(1)=subplot(211);
PlotSpectre(mg, Fs);
title("Guitare");
%xlim([0, 5e3]);

H(2)=subplot(212);
PlotSpectre(mp, Fs);
title("Piano");
%xlim([0, 5e3]);

linkaxes(H);