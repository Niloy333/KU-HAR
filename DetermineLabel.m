function L = DetermineLabel(F)
    if contains(F,"_A_")==1
    	L=0;
    elseif contains(F,"_B_")==1
        L=1;
    elseif contains(F,"_C_")==1
        L=2;
    elseif contains(F,"_D_")==1
        L=3;
    elseif contains(F,"_E_")==1
        L=4;
    elseif contains(F,"_F_")==1
        L=5;
    elseif contains(F,"_G_")==1
        L=6;
    elseif contains(F,"_H_")==1
        L=7;
    elseif contains(F,"_I_")==1
        L=8;
    elseif contains(F,"_J_")==1
        L=9;
    elseif contains(F,"_K_")==1
        L=10;
    elseif contains(F,"_L_")==1
        L=11;
    elseif contains(F,"_M_")==1
        L=12;
    elseif contains(F,"_N_")==1
        L=13;
    elseif contains(F,"_O_")==1
        L=14;
%     elseif contains(F,"_P_")==1
%         L=15;
%     elseif contains(F,"_Q_")==1
%         L=16;
%     elseif contains(F,"_R_")==1
%         L=17;
    elseif contains(F,"_S_")==1
        L=15;
    elseif contains(F,"_T_")==1
        L=16;
    elseif contains(F,"_U_")==1
        L=17;
%     elseif contains(F,"_V_")==1
%         L=21;
    end