clc
close all
clear all

files = dir('F:\Biomedical Resaearch\HAR data Collection\RAW\30_07_19');
DIR='F:\Biomedical Resaearch\HAR data Collection\RAW\30_07_19\';

INDX= readtable('F:\Biomedical Resaearch\HAR data Collection\RAW\time_30_07_19.xlsx');
SL= table2array(INDX(:,1));
FL= table2array(INDX(:,2));
FL= string(FL(:,1));
FL= erase(FL(:,1),"'");
no_SMP= table2array(INDX(:,3));
DUR= table2array(INDX(:,4));
STRT= table2array(INDX(:,5));
STOP= table2array(INDX(:,6));
clear INDX

SZ= size(files);
Fs= 100;
Max_Dur= max(DUR);
Max_Pnt= Max_Dur*Fs;
Tot_Sig= sum(no_SMP);
SIG= zeros(Tot_Sig, Max_Pnt*6+3);
SAMP=1;

for i=1:1:size(FL)
    X1= FL(i);
    X2= strcat(DIR,X1);
    AA= csvread(X2);
    
    if (STRT(i)~=0 && STOP(i)==0)
        AA= AA(STRT(i)*Fs:end,:);
    elseif (STRT(i)==0 && STOP(i)~=0)
        AA= AA(1:STOP(i)*Fs,:);
    elseif (STRT(i)~=0 && STOP(i)~=0)
        AA= AA(STRT(i)*Fs:STOP(i)*Fs,:);
    end
    SZ2= size(AA);
    PNTS= floor(SZ2(1)/no_SMP(i));
    L= DetermineLabel(FL(i));
        
    for j=1:1:no_SMP(i)
        SIG(SAMP,1:PNTS)= AA((j-1)*PNTS+1:(j-1)*PNTS+PNTS,2);
        SIG(SAMP,Max_Pnt+1:Max_Pnt+PNTS)= AA((j-1)*PNTS+1:(j-1)*PNTS+PNTS,3);
        SIG(SAMP,Max_Pnt*2+1:Max_Pnt*2+PNTS)= AA((j-1)*PNTS+1:(j-1)*PNTS+PNTS,4);
        SIG(SAMP,Max_Pnt*3+1:Max_Pnt*3+PNTS)= AA((j-1)*PNTS+1:(j-1)*PNTS+PNTS,6);
        SIG(SAMP,Max_Pnt*4+1:Max_Pnt*4+PNTS)= AA((j-1)*PNTS+1:(j-1)*PNTS+PNTS,7);
        SIG(SAMP,Max_Pnt*5+1:Max_Pnt*5+PNTS)= AA((j-1)*PNTS+1:(j-1)*PNTS+PNTS,8);
        SIG(SAMP,Max_Pnt*6+1)= L;
        SIG(SAMP,Max_Pnt*6+2)= PNTS;
        SIG(SAMP,Max_Pnt*6+3)= SAMP;
        SAMP=SAMP+1;
    end   
end

%csvwrite('KUhar_30_07_raw_1500.csv',SIG(:,1:9003));
