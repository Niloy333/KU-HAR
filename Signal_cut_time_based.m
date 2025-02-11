clc; close all; clear all

TABLE = readtable('D:\HAR data Collection Project\codes_n_data\HAR_cut_info_corrected.xlsx');
Szt= size(TABLE);
Fs = 100;
FL= erase(string(table2array(TABLE(:,1))),"'");
[STRT, STOP]= deal(table2array(TABLE(:,4)), table2array(TABLE(:,5)));

PNTS = 400;
Max_Pnt = PNTS;
SIG =  zeros(30000, PNTS*6+3);

files2 = dir('D:\HAR data Collection Project\Dataset_upload\Version_1.5\1.Raw_time_domian_data1945');
%DIR = 'D:\HAR data Collection Project\Dataset_upload\Version_1.5\2.Trimmed_raw_data1945\';
Sz2= size(files2);
SAMP =1;

for i=3:1:Sz2(1)
    Nm = strcat(files2(i).folder,'\',files2(i).name);
    files3 = dir(Nm);
    Sz3= size(files3);
    for j=3:1:Sz3(1)
        Nm3 = files3(j).name;
        Nm4 = strcat(files3(j).folder,'\',files3(j).name);
        AA = csvread(Nm4);
                
        Pnt = find(contains(FL, Nm3), 1, 'first');    
        if (STRT(Pnt)~=0 && STOP(Pnt)==0)   % trim
            AA= AA(STRT(Pnt)*Fs:end,:);
        elseif (STRT(Pnt)==0 && STOP(Pnt)~=0)
            AA= AA(1:STOP(Pnt)*Fs,:);
        elseif (STRT(Pnt)~=0 && STOP(Pnt)~=0)
            AA= AA(STRT(Pnt)*Fs:STOP(Pnt)*Fs,:);
        end
        
        AA = Interpolation_100hz(AA); %interpolation
        SZa= size(AA);
        %NAM = strcat(DIR, files2(i).name, '\', Nm3);
        % csvwrite(NAM, AA);
        
        no_SMP = SZa(1)/PNTS;
        L= DetermineLabel(Nm3);
         
         for k=1: 1: floor(no_SMP)
            SIG(SAMP,1:PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,2);
            SIG(SAMP,Max_Pnt+1:Max_Pnt+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,3);
            SIG(SAMP,Max_Pnt*2+1:Max_Pnt*2+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,4);
            SIG(SAMP,Max_Pnt*3+1:Max_Pnt*3+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,6);
            SIG(SAMP,Max_Pnt*4+1:Max_Pnt*4+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,7);
            SIG(SAMP,Max_Pnt*5+1:Max_Pnt*5+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,8);
            SIG(SAMP,Max_Pnt*6+1)= L;
            SIG(SAMP,Max_Pnt*6+2)= PNTS;
            SIG(SAMP,Max_Pnt*6+3)= SAMP;            
            SAMP=SAMP+1      
         end
         
         if no_SMP - floor(no_SMP) >= .5
            SIG(SAMP, 1:PNTS)= AA(end-PNTS+1: end, 2);
            SIG(SAMP, Max_Pnt+1:Max_Pnt+PNTS)= AA(end-PNTS+1: end, 3);
            SIG(SAMP, Max_Pnt*2+1:Max_Pnt*2+PNTS)= AA(end-PNTS+1: end, 4);
            SIG(SAMP, Max_Pnt*3+1:Max_Pnt*3+PNTS)= AA(end-PNTS+1: end, 6);
            SIG(SAMP, Max_Pnt*4+1:Max_Pnt*4+PNTS)= AA(end-PNTS+1: end, 7);
            SIG(SAMP, Max_Pnt*5+1:Max_Pnt*5+PNTS)= AA(end-PNTS+1: end, 8);
            SIG(SAMP, Max_Pnt*6+1)= L;
            SIG(SAMP, Max_Pnt*6+2)= PNTS;
            SIG(SAMP, Max_Pnt*6+3)= SAMP;            
            SAMP=SAMP+1             
         end
        clear AA
    end
end


for i=1:1:length(SIG(:,1))
    if SIG(i, Max_Pnt*6+2) > Max_Pnt
        SIG(i, Max_Pnt*6+2) = Max_Pnt;
    end
end

SIG = SIG(1:SAMP-1, 1:Max_Pnt*6+3);

csvwrite('D:\HAR data Collection Project\codes_n_data\New_data\KU-HAR_time_15601_time.csv', SIG);

% Sample_to_file = array2table(Sample_no, FILE_name(2:end,1), FILE_ptr);
% headers = {'A' 'B' 'C' 'D' 'E'};
% data = cell(4,5);
% T = cell2table(data);
% T.Properties.VariableNames = headers

load train
sound(y,Fs);
% if (no_SMP(Pnt)*DUR(Pnt)*100) > SZa(1)+1
%     TOTAL= no_SMP(Pnt)*DUR(Pnt)*100
%     TOTAL
% end
SIG = SIG(1:8622, :);

% SIG2 = csvread('HAR_raw_resampled_1500_18c.csv');
binc = [0:17];
counts = hist(FFT1(:,Max_Pnt*6+1), binc);
result = [binc; counts];
%csvwrite('samples_per_class.csv', result');

%AA = csvread('D:\HAR data Collection Project\codes_n_data\HAR_raw_18_class.csv');

%AAA = csvread('D:\HAR data Collection Project\codes_n_data\KU-HAR_v1.5_raw_samples_interpolated.csv');


inds = zeros(0,0);

for i=1:1:23588
    if SIG(i,2404) ~= 0
        inds = [inds; i];
    end
end
PROB = FILE_name(inds);







