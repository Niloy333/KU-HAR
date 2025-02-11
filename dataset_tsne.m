clc
close all
clear all

D1=csvread('KU-HAR_v1.0_frequency_features');
Y= csvread('J:\umap_HAR_fft (copy).csv');

S1=strings(480,1);

for i=1:1:9185
    if (D1(i,end))==0
        S1(i,:)='HBC';
    elseif (D1(i,end))==1
        S1(i,:)='IRF';
    elseif (D1(i,end))==2
        S1(i,:)='BRF';
    elseif (D1(i,end))==3
         S1(i,:)='ORF';
    end
end

Y=tsne(FFT1(:,1:9000));
csvwrite('tsne_HAR_fft_1500_18c_exact.csv', Y);
figure; 
set(gcf, 'DefaultAxesFontName', 'CMU Serif');
set(gcf, 'DefaultTextFontName', 'CMU Serif');
gscatter(Y(:,1),Y(:,2),D1(:,9001));
grid on

Y=tsne(D2(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
gscatter(Y(:,1),Y(:,2),S1,[34/255 153/255 84/255; 1 0 0; 0 0 1; 126/255 77/255 77/255])
grid on

Y=tsne(D3(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
gscatter(Y(:,1),Y(:,2),S1,[34/255 153/255 84/255; 1 0 0; 0 0 1; 126/255 77/255 77/255])
grid on

%%%%%%%%%%%
%Y=tsne(D4(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Time New Roman');
set(gcf, 'DefaultTextFontName', 'Time New Roman');
gscatter(Yf(:,2),Yf(:,1), DT(:,end-2), c(2:19, :),'*', 9);
xlim([-125 140])
ylim([-115 125])
grid on


P1=zeros(480,1026);
P2=zeros(480,1026);
P3=zeros(480,1026);
P4=zeros(480,1026);

for i=1:1:480
    P=pmtm(D1(i,1:end-1))';
    P1(i,1:end-1)=P;
    P1(i,end)=D1(i,end);
    
    P=pmtm(D2(i,1:end-1))';
    P2(i,1:end-1)=P;
    P2(i,end)=D2(i,end);
    
    P=pmtm(D3(i,1:end-1))';
    P3(i,1:end-1)=P;
    P3(i,end)=D3(i,end);
    
    P=pmtm(D4(i,1:end-1))';
    P4(i,1:end-1)=P;
    P4(i,end)=D4(i,end);
end

Y=tsne(P1(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
gscatter(Y(:,1),Y(:,2),S1,[34/255 153/255 84/255; 1 0 0; 0 0 1; 126/255 77/255 77/255])
grid on

Y=tsne(P2(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
gscatter(Y(:,1),Y(:,2),S1,[34/255 153/255 84/255; 1 0 0; 0 0 1; 126/255 77/255 77/255])
grid on

Y=tsne(P3(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
gscatter(Y(:,1),Y(:,2),S1,[34/255 153/255 84/255; 1 0 0; 0 0 1; 126/255 77/255 77/255])
grid on

Y=tsne(P4(:,1:end-1),'Algorithm','exact');
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
gscatter(Y(:,1),Y(:,2),S1,[34/255 153/255 84/255; 1 0 0; 0 0 1; 126/255 77/255 77/255])
grid on

Fs = 12000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1013;             % Length of signal
t = (0:L-1)*T;
figure;
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
set(gcf, 'DefaultAxesFontSize', 12);
plot (t,D1(1,1:end-1),'LineWidth',1)
ylabel('Voltage(mV)')
xlabel('Time(s)')
xlim([0 L/Fs+.001])
grid on


P22 = abs(P1(1,1:end-1)/L);
P11 = P22(1,1:(L/2));
P11(2:end-1) = 2*P11(2:end-1);

f = Fs*(0:(L/2))/L;
figure; 
set(gcf, 'DefaultAxesFontName', 'Palatino Linotype');
set(gcf, 'DefaultTextFontName', 'Palatino Linotype');
set(gcf, 'DefaultAxesFontSize', 12);
plot (f,P1(1,1:end-1),'LineWidth',1)
xlabel('Power(dB)')
ylabel('Frequency(Hz)')
grid on

csvwrite('pmtm_DT1.csv',P1);
csvwrite('pmtm_DT2.csv',P2);
csvwrite('pmtm_DT3.csv',P3);
csvwrite('pmtm_DT4.csv',P4);

c=[240/255 163/255 255/255; 0/255 117/255 220/255; 153/255 63/255 0/255; 76/255 0/255 92/255; 25/255 25/255 25/255; 0/255 92/255 49/255; 43/255 206/255 72/255; 255/255 204/255 153/255; 128/255 128/255 128/255; 148/255 255/255 181/255; 143/255 124/255 0/255; 157/255 204/255 0/255; 194/255 0/255 136/255; 0/255 51/255 128/255; 255/255 164/255 5/255; 255/255 168/255 187/255; 66/255 102/255 0/255; 255/255 0/255 16/255; 94/255 241/255 242/255; 0/255 153/255 143/255; 224/255 255/255 102/255; 116/255 10/255 255/255; 153/255 0/255 0/255; 255/255 255/255 128/255; 255/255 255/255 0/255; 255/255 80/255 5/255];






