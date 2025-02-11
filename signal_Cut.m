% clc
% close all
% clear all
% warning off

files = dir('G:\HAR data Collection Project\Farzana\WALK FORWORD');
DIR='G:\HAR data Collection Project\Farzana\WALK FORWORD\';

for i=3:1:689
X1=files(i).name;
X= strcat(DIR,X1);


%X = "D:\HAR data Collection Project\Dataset_upload\Version_1.5\1.Raw_time_domian_data1945\10.Sit-up\1026_K_4.csv";
DT= csvread(X);
DT2= DT';
SZ=size(DT2(1,:));
fs=100;
t=1/fs:1/fs:SZ(2)/fs;
figure;
subplot (6,1,1)
plot (t,DT2(2,:),'b');
grid on
%title(X1)
subplot (6,1,2)
plot (t,DT2(3,:),'r');
grid on
subplot (6,1,3)
plot (t,DT2(4,:),'g');
grid on
subplot (6,1,4)
plot (t,DT2(6,:),'b');
grid on
subplot (6,1,5)
plot (t,DT2(7,:),'r');
grid on
subplot (6,1,6)
plot (t,DT2(8,:),'g');
grid on

hold off
close all
end

% AA=csvread("F:\Biomedical Resaearch\HAR data Collection\RAW\30_07_19\1004_S_1.csv");
% plot(AA(:,2))
% AA1= AA(1:5000,:);
% AA2= AA(5001:end,:);
% 
% csvwrite("F:\Biomedical Resaearch\HAR data Collection\RAW\30_07_19\1004_T_1.csv",AA2);
