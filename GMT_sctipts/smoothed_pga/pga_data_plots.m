clc
clear all
close all 


load ('pga_10_50_mean_m_45.txt');
load ('pga_10_50_mean_m_45_uniform.txt');
load ('pga_10_50_mean_m_5.txt');
load ('pga_10_50_mean_m_5_uniform.txt');
load ('pga_10_50_minus_m_45.txt');
load ('pga_10_50_minus_m_45_uniform.txt');
load ('pga_10_50_minus_m_5.txt');
load ('pga_10_50_minus_m_5_uniform.txt');
load ('pga_10_50_plus_m_45.txt');
load ('pga_10_50_plus_m_45_uniform.txt');
load ('pga_10_50_plus_m_5.txt');
load ('pga_10_50_plus_m_5_uniform.txt');
load ('pga_2_50_mean_m_45.txt');
load ('pga_2_50_mean_m_45_uniform.txt');
load ('pga_2_50_mean_m_5.txt');
load ('pga_2_50_mean_m_5_uniform.txt');
load ('pga_2_50_minus_m_45.txt');
load ('pga_2_50_minus_m_45_uniform.txt');
load ('pga_2_50_minus_m_5.txt');
load ('pga_2_50_minus_m_5_uniform.txt');
load ('pga_2_50_plus_m_45.txt');
load ('pga_2_50_plus_m_45_uniform.txt');
load ('pga_2_50_plus_m_5.txt');
load ('pga_2_50_plus_m_5_uniform.txt');


% NW differ slightly in 2% & 10% 
figure;
scatter3(pga_2_50_mean_m_5_uniform(:,1),pga_2_50_mean_m_5_uniform(:,2),pga_2_50_mean_m_5_uniform(:,3),40,pga_2_50_mean_m_5_uniform(:,3),'filled')
title ('pga-2-50-mean-m-5-uniform')


figure;
scatter3(pga_10_50_mean_m_5_uniform(:,1),pga_10_50_mean_m_5_uniform(:,2),pga_10_50_mean_m_5_uniform(:,3),40,pga_10_50_mean_m_5_uniform(:,3),'filled')
title ('pga-10-50-mean-m-5-uniform')

% 
% %%%%%%%%%%%%%%%%%%%

figure;
scatter3(pga_2_50_mean_m_5(:,1),pga_2_50_mean_m_5(:,2),pga_2_50_mean_m_5(:,3),40,pga_2_50_mean_m_5(:,3),'filled')
title ('pga-2-50-mean-m-5')


figure;
scatter3(pga_10_50_mean_m_5(:,1),pga_10_50_mean_m_5(:,2),pga_10_50_mean_m_5(:,3),40,pga_10_50_mean_m_5(:,3),'filled')
title ('pga-10-50-mean-m-5')


% %%%%%%%%%%%%%%%%%%%

figure;
scatter3(pga_2_50_mean_m_45_uniform(:,1),pga_2_50_mean_m_45_uniform(:,2),pga_2_50_mean_m_45_uniform(:,3),40,pga_2_50_mean_m_45_uniform(:,3),'filled')
title ('pga-2-50-mean-m-45-uniform')


figure;
scatter3(pga_10_50_mean_m_45_uniform(:,1),pga_10_50_mean_m_45_uniform(:,2),pga_10_50_mean_m_45_uniform(:,3),40,pga_10_50_mean_m_45_uniform(:,3),'filled')
title ('pga-10-50-mean-m-45-uniform')

% 
% %%%%%%%%%%%%%%%%%%%

figure;
scatter3(pga_2_50_mean_m_45(:,1),pga_2_50_mean_m_45(:,2),pga_2_50_mean_m_45(:,3),40,pga_2_50_mean_m_45(:,3),'filled')
title ('pga-2-50-mean-m-45')


figure;
scatter3(pga_10_50_mean_m_45(:,1),pga_10_50_mean_m_45(:,2),pga_10_50_mean_m_45(:,3),40,pga_10_50_mean_m_45(:,3),'filled')
title ('pga-10-50-mean-m-45')

% 
% %%%%%%%%%%%%%%%%%%%
figure;
scatter3(pga_2_50_minus_m_5_uniform(:,1),pga_2_50_minus_m_5_uniform(:,2),pga_2_50_minus_m_5_uniform(:,3),40,pga_2_50_minus_m_5_uniform(:,3),'filled')
title ('pga-2-50-minus-m-5-uniform')

% 
figure;
scatter3(pga_10_50_minus_m_5_uniform(:,1),pga_10_50_minus_m_5_uniform(:,2),pga_10_50_minus_m_5_uniform(:,3),40,pga_10_50_minus_m_5_uniform(:,3),'filled')
title ('pga-10-50-minus-m-5-uniform')


% %%%%%%%%%%%%%%%%%%%

figure;
scatter3(pga_2_50_minus_m_5(:,1),pga_2_50_minus_m_5(:,2),pga_2_50_minus_m_5(:,3),40,pga_2_50_minus_m_5(:,3),'filled')
title ('pga-2-50-minus-m-5')

% 
% 
figure;
scatter3(pga_10_50_minus_m_5(:,1),pga_10_50_minus_m_5(:,2),pga_10_50_minus_m_5(:,3),40,pga_10_50_minus_m_5(:,3),'filled')
title ('pga-10-50-minus-m-5')

% % 
% %%%%%%%%%%%%%%%%%%%
% 
% 2% and 10% different
figure;
scatter3(pga_2_50_minus_m_45_uniform(:,1),pga_2_50_minus_m_45_uniform(:,2),pga_2_50_minus_m_45_uniform(:,3),40,pga_2_50_minus_m_45_uniform(:,3),'filled')
title ('pga-2-50-minus-m-45-uniform')
% 
figure;
scatter3(pga_10_50_minus_m_45_uniform(:,1),pga_10_50_minus_m_45_uniform(:,2),pga_10_50_minus_m_45_uniform(:,3),40,pga_10_50_minus_m_45_uniform(:,3),'filled')
title ('pga-10-50-minus-m-45-uniform')
% 
% %%%%%%%%%%%%%%%%%%%
% 2% and 10% different

figure;
scatter3(pga_2_50_minus_m_45(:,1),pga_2_50_minus_m_45(:,2),pga_2_50_minus_m_45(:,3),40,pga_2_50_minus_m_45(:,3),'filled')
title ('pga-2-50-minus-m-45')



figure;
scatter3(pga_10_50_minus_m_45(:,1),pga_10_50_minus_m_45(:,2),pga_10_50_minus_m_45(:,3),40,pga_10_50_minus_m_45(:,3),'filled')
title ('pga-10-50-minus-m-45')

% 
% %%%%%%%%%%%%%%%%%%%
figure;
scatter3(pga_2_50_plus_m_5_uniform(:,1),pga_2_50_plus_m_5_uniform(:,2),pga_2_50_plus_m_5_uniform(:,3),40,pga_2_50_plus_m_5_uniform(:,3),'filled')
title ('pga-2-50-plus-m-5-uniform')


figure;
scatter3(pga_10_50_plus_m_5_uniform(:,1),pga_10_50_plus_m_5_uniform(:,2),pga_10_50_plus_m_5_uniform(:,3),40,pga_10_50_plus_m_5_uniform(:,3),'filled')
title ('pga-10-50-plus-m-5-uniform')

% 
% %%%%%%%%%%%%%%%%%%%
%2% 10% for the east
figure;
scatter3(pga_2_50_plus_m_5(:,1),pga_2_50_plus_m_5(:,2),pga_2_50_plus_m_5(:,3),40,pga_2_50_plus_m_5(:,3),'filled')
title ('pga-2-50-plus-m-5')

% 
figure;
scatter3(pga_10_50_plus_m_5(:,1),pga_10_50_plus_m_5(:,2),pga_10_50_plus_m_5(:,3),40,pga_10_50_plus_m_5(:,3),'filled')
title ('pga-10-50-plus-m-5')


% %%%%%%%%%%%%%%%%%%%
% good sample of difference
figure;
scatter3(pga_2_50_plus_m_45_uniform(:,1),pga_2_50_plus_m_45_uniform(:,2),pga_2_50_plus_m_45_uniform(:,3),40,pga_2_50_plus_m_45_uniform(:,3),'filled')
title ('pga-2-50-plus-m-45-uniform')
savefig ('pga_2_50_plus_m_45_uniform')

figure;
scatter3(pga_10_50_plus_m_45_uniform(:,1),pga_10_50_plus_m_45_uniform(:,2),pga_10_50_plus_m_45_uniform(:,3),40,pga_10_50_plus_m_45_uniform(:,3),'filled')
title ('pga-10-50-plus-m-45-uniform')
savefig ('pga_10_50_plus_m_45_uniform')
% % 
% %%%%%%%%%%%%%%%%%%%
% east & north
figure;
scatter3(pga_2_50_plus_m_45(:,1),pga_2_50_plus_m_45(:,2),pga_2_50_plus_m_45(:,3),40,pga_2_50_plus_m_45(:,3),'filled')
title ('pga-2-50-plus-m-45')
savefig ('pga_2_50_plus_m_45')


figure;
scatter3(pga_10_50_plus_m_45(:,1),pga_10_50_plus_m_45(:,2),pga_10_50_plus_m_45(:,3),40,pga_10_50_plus_m_45(:,3),'filled')
title ('pga-10-50-plus-m-45')
savefig ('pga_10_50_plus_m_45')

