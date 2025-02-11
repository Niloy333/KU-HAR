clc; close all; clear all

TABLE = readtable('D:\HAR data Collection Project\codes_n_data\HAR_cut_info_corrected.xlsx');
Szt= size(TABLE);
Fs = 100;
FL= erase(string(table2array(TABLE(:,1))),"'");
[no_SMP, DUR, STRT, STOP]= deal(table2array(TABLE(:,2)), table2array(TABLE(:,3)), table2array(TABLE(:,4)), table2array(TABLE(:,5)));
[Max_Pnt, Tot_Sig, SAMP]= deal(max(DUR)*Fs, sum(no_SMP), 1);
SIG= zeros(Tot_Sig, Max_Pnt*6+3);

[Sample_no ,FILE_name, FILE_ptr] = deal(zeros(0,0), strings, zeros(0,0));

DIR2= 'D:\HAR data Collection Project\codes_n_data\trimmed_raw_signals\';

files2 = dir('D:\HAR data Collection Project\codes_n_data\raw_signals');
Sz2= size(files2);
%Sample_cnt= zeros(0,0);
Samp =0;
for i=3:1:Sz2(1)
    Nm = strcat(files2(i).folder,'\',files2(i).name);
    files3 = dir(Nm);
    Sz3= size(files3);
    for j=3:1:Sz3(1)
        Nm3 = files3(j).name;
        Nm4 = strcat(files3(j).folder,'\',files3(j).name);
        AA = csvread(Nm4);
        SZb= size(AA);
                
        Pnt = find(contains(FL, Nm3), 1, 'first');    
        if (STRT(Pnt)~=0 && STOP(Pnt)==0)
            AA= AA(STRT(Pnt)*Fs:end,:);
        elseif (STRT(Pnt)==0 && STOP(Pnt)~=0)
            AA= AA(1:STOP(Pnt)*Fs,:);
        elseif (STRT(Pnt)~=0 && STOP(Pnt)~=0)
            AA= AA(STRT(Pnt)*Fs:STOP(Pnt)*Fs,:);
        end
        STR = strcat(DIR2, Nm3);
        csvwrite(STR, AA);
        
Samp = Samp +1
         
        clear AA
    end
end
%csvwrite('HAR_raw_18_class.csv', SIG);

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
SIG = SIG(1:9185, :);

% SIG2 = csvread('HAR_raw_resampled_1500_18c.csv');
binc = [0:21];
counts = hist(SIG(:,9001), binc);
result = [binc; counts];
% csvwrite('samples_per_class.csv', result');

%AA = csvread('D:\HAR data Collection Project\codes_n_data\HAR_raw_18_class.csv');

