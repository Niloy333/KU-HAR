clc
close all
clear all

DT1= csvread('KU-HAR_v1.0_raw_samples.csv');

FFT1 = zeros(size(SIG));
% 
% for i=1: 1: length(SIG(:,1))
%     for j = 1:1500:9000
%         FFT1(i, j:j+1500) = abs(fft(DT1(i, j:j+1500)));
%     end
%     i
% end
% FFT1(:, 9001) = DT1(:, 9001);
% FFT1(:, 9002) = 1500;
% FFT1(:, 9003) = DT1(:, 9003);
% 
% csvwrite('KU-HAR_v1.0_frequency_features.csv', FFT1);

% DT1= DT1(1:7390, :);
%DT2= csvread('KUhar_31_07_raw_1500.csv');
Sz= size(SIG);
%Fs= 100;
Max_Step= Max_Pnt;

Re_SIG= zeros(Sz);

for i=1:1:Sz(1)         %resampling all signals
    Step= SIG(i, Max_Pnt*6+2);
    for j=0:1:5
        Re_SIG(i, Max_Step*j+1 : Max_Step*(j+1)) = resample(SIG(i, Max_Step*j+1 ...
            : Max_Step*j+Step), Max_Step, Step);
    end
    i
end
Re_SIG(:, Max_Pnt*6: Max_Pnt*6+3) = SIG(:, Max_Pnt*6: Max_Pnt*6+3);
Re_SIG(:, Max_Pnt*6+2) = Max_Pnt;
%csvwrite('HAR_raw_resampled_1500_18c.csv', Re_SIG);
csvwrite('D:\HAR data Collection Project\codes_n_data\New_data\KU-HAR_event_15601x400_time_resampled.csv', SIG);

FFT1= zeros(Sz);
for i=1:1:Sz(1)         %extracting FFT features
    Step= Re_SIG(i, Max_Pnt*6+2);
    for j=0:1:5
        FFT1(i, Max_Step*j+1 : Max_Step*(j+1)) = abs(fft((SIG(i, Max_Step*j+1 ...
            : Max_Step*(j+1)))));
    end
    i
end
FFT1(:, Max_Pnt*6: Max_Pnt*6+3) = SIG(:, Max_Pnt*6: Max_Pnt*6+3);
csvwrite('D:\HAR data Collection Project\codes_n_data\New_data\HAR_time_15601x400_fft.csv', FFT1);



FFF= [FFT1;FFT2];
FFF(:,end)=FFF(:,end)-1;
LABs = FFF2(:,end);
binc = [0:10];
counts = hist(LABs,binc);
result = [binc; counts];

S=1;
for i=1:1:780
    if FFF(i,end)<11
        FFF2(S,:)=FFF(i,:);
        S=S+1;
    end
end
        
%csvwrite('test1.csv',FFF2); 


% t = .01:.01:1;
% fs= 2;
% y= sin(2*pi*fs*t);
% figure; plot(t,y);
% yy = abs(fft(y));
% figure; plot(yy);
% Y= resample(y, 1000, 100);
% figure; plot(Y);
% YY = abs(fft(y));
% figure; plot(YY);


T1 = SIG(1, 1: 400);
T2 = SIG(1, 1: SIG(1, Max_Pnt*6+2));

F1 = abs(fft(T1));
F2 = abs(fft(T2));

figure; plot(SIG(1,1: SIG(Max_Pnt*6+2))
figure; plot(Re_SIG(1: )



