function [AA2] = Interpolation_100hz(AA)

% AA = csvread('D:\HAR data Collection Project\Dataset_upload\Version_1.0\2.Trimmed_raw_data\0.Stand\1002_A_6.csv');
    [pre_At, pre_AX, pre_AY, pre_AZ, pre_Gt, pre_GX, pre_GY, pre_GZ] ...
        = deal(AA(:, 1)', AA(:, 2)', AA(:, 3)', AA(:, 4)', AA(:, 5)', AA(:, 6)', AA(:, 7)', AA(:, 8)');

    new_At = AA(1, 1): 1/100: AA(end, 1);
    new_Gt = AA(1, 5): 1/100: AA(end, 5);

    % Duplicate_check
    [pre_At1, index1] = unique(pre_At);
    if length(pre_At1) ~= length(pre_At)
        remv = setdiff(1:numel(pre_At), index1, 'stable');
        pre_AX(remv) = [];
        pre_AY(remv) = [];
        pre_AZ(remv) = [];
        pre_At = pre_At1;
    end

    [pre_Gt1, index2] = unique(pre_Gt);
    if length(pre_Gt1) ~= length(pre_Gt)
        remv = setdiff(1:numel(pre_Gt), index2, 'stable');
        pre_GX(remv) = [];
        pre_GY(remv) = [];
        pre_GZ(remv) = [];
        pre_Gt = pre_Gt1;
    end
    %

    new_AX = interp1(pre_At, pre_AX, new_At, 'spline');
    new_AY = interp1(pre_At, pre_AY, new_At, 'spline');
    new_AZ = interp1(pre_At, pre_AZ, new_At, 'spline');
    new_GX = interp1(pre_Gt, pre_GX, new_Gt, 'spline');
    new_GY = interp1(pre_Gt, pre_GY, new_Gt, 'spline');
    new_GZ = interp1(pre_Gt, pre_GZ, new_Gt, 'spline');

    % padding zeros of uneven length of Acc and Gyro data
    if length(new_At) > length(new_Gt)
        pad = length(new_At) - length(new_Gt);
        [new_Gt, new_GX, new_GY, new_GZ] = deal( [new_Gt zeros(1,pad)],  ...
            [new_GX zeros(1,pad)], [new_GY zeros(1,pad)], [new_GZ zeros(1,pad)]);

    elseif length(new_At) < length(new_Gt)
        pad = length(new_Gt) - length(new_At);
        [new_At, new_AX, new_AY, new_AZ] = deal( [new_At zeros(1,pad)],  ...
            [new_AX zeros(1,pad)], [new_AY zeros(1,pad)], [new_AZ zeros(1,pad)]);
    end

    AA2 = [new_At; new_AX; new_AY; new_AZ; new_Gt; new_GX; new_GY; new_GZ];
    AA2 = AA2';
end







