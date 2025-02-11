clc
close all 
clear all

files = dir('D:\HAR data Collection Project\codes_n_data\raw_signals\TT_2_08_19');
DIR = 'D:\HAR data Collection Project\codes_n_data\raw_signals\TT_2_08_19\';
Sz2= size(files2);

DT = csvread('D:\HAR data Collection Project\codes_n_data\raw_signals\TT_2_08_19\1089_U_2.csv');

DT(:,2) = flip(DT(:,2));
DT(:,3) = flip(DT(:,3));
DT(:,4) = flip(DT(:,4));
DT(:,6) = flip(DT(:,6));
DT(:,7) = flip(DT(:,7));
DT(:,8) = flip(DT(:,8));

csvwrite('D:\HAR data Collection Project\codes_n_data\raw_signals\TT_2_08_19\1089_U_1.csv', DT);



AA=AA+x;
AA=round(AA,2);
AA=AA';