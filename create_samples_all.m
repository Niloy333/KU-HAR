clc; close all; clear all
% 
% files = dir('D:\HAR data Collection Project\codes_n_data\signal_cut_info');
% Sz= size(files);
% TABLE = zeros(0,0);
% 
% for i=3:1:Sz(1)
%     Nm = strcat(files(i).folder,'\',files(i).name);
%     INDX= readtable(Nm);
%     TABLE = [TABLE; INDX];
%     clear INDX 
% endD:\HAR data Collection Project\codes_n_data
% %writetable(TABLE(:,2:end),'HAR_cut_info.xlsx');
%%writetable(TABLE,'HAR_cut_info_corrected.xlsx');

TABLE = readtable('D:\HAR data Collection Project\codes_n_data\HAR_cut_info_corrected.xlsx');
Szt= size(TABLE);
Fs = 100;
FL= erase(string(table2array(TABLE(:,1))),"'");
[no_SMP, DUR, STRT, STOP]= deal(table2array(TABLE(:,2)), table2array(TABLE(:,3)), table2array(TABLE(:,4)), table2array(TABLE(:,5)));
[Max_Pnt, Tot_Sig, SAMP]= deal(max(DUR)*Fs, sum(no_SMP), 1);
SIG= zeros(Tot_Sig, Max_Pnt*6+3);

[Sample_no ,FILE_name, FILE_ptr] = deal(zeros(0,0), strings, zeros(0,0));

files2 = dir('D:\HAR data Collection Project\codes_n_data\raw_signals');
Sz2= size(files2);
Sample_cnt= zeros(0,0);
Samp =1;
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
        SZa= size(AA);     
                
        PNTS= floor(SZa(1)/no_SMP(Pnt));
        L= DetermineLabel(Nm3);
         
         for k=1:1:no_SMP(Pnt)
            SIG(SAMP,1:PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,2);
            SIG(SAMP,Max_Pnt+1:Max_Pnt+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,3);
            SIG(SAMP,Max_Pnt*2+1:Max_Pnt*2+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,4);
            SIG(SAMP,Max_Pnt*3+1:Max_Pnt*3+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,6);
            SIG(SAMP,Max_Pnt*4+1:Max_Pnt*4+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,7);
            SIG(SAMP,Max_Pnt*5+1:Max_Pnt*5+PNTS)= AA((k-1)*PNTS+1:(k-1)*PNTS+PNTS,8);
            SIG(SAMP,Max_Pnt*6+1)= L;
            SIG(SAMP,Max_Pnt*6+2)= PNTS;
            SIG(SAMP,Max_Pnt*6+3)= SAMP;
            
            Sample_no= [Sample_no; SAMP]; 
            FILE_name= [FILE_name; Nm3];
            FILE_ptr= [FILE_ptr; Pnt];
            SAMP=SAMP+1      
        
%             if SAMP == 5634, error('problem'), end
         end
        clear AA
    end
end
csvwrite('KU-HAR_v1.0_raw_samples.csv', SIG);

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

