%%  Project for Data Analysis Course 2021-2022
%
%       Group 54 - Dimitrios Demiris Folas 9415
%       
%       Country : mod(9415,25) + 1 = 16 : Latvia 
%
%   Since there are not enough data for Latvia, the country I chose to
%       work with that is neighbor with Latvia, is Lithuania.
%       Thus, COUNTRY OF INTEREST A: Lithuania
%

%% Exercise 4

%% Clearing

clear;
clc;
close all;

%%  Importing:

%
%       WE RETAIN ONLY THE ESSENTIAL INFORMATION FOR THE SPECIFIC USE OF THE PROGRAM, BY FILTERING THE REST OF THE DATA IN THE EXCEL FILE
%

data21 = readtable('EuropeanPR21Ex5.xlsx');

Countries = readtable('EuropeanCountries.xlsx');
countries = Countries.Country;

%   2 Countries with the highest Correlation are Ireland & Iceland:

Ireland_PR_2021 = Group54Exe4Func1('Ireland',data21);
Iceland_PR_2021 = Group54Exe4Func1('Iceland',data21);
Greece_PR_2021  = Group54Exe4Func1('Greece',data21);

%%  Bootstrap Test

pr1 = [Ireland_PR_2021 Greece_PR_2021];
pr2 = [Iceland_PR_2021 Greece_PR_2021];

%
%   Using standard code for Boostrap Test for difference between 2 vectors,
%       but with the Correlation Coefficient as a function handle:
%   

B       = 1000;
alpha   = 0.05;

ts = tinv([0.025  0.975],2 * length(Greece_PR_2021) - 2);

lowerLim = (B + 1) * alpha / 2;
upperLim = B + 1 - lowerLim;

limits = [lowerLim upperLim];
limits = floor(limits);

bootstraps_corr1 = bootstrp(B,@corrcoef,pr1);
bootstraps_corr1 = bootstraps_corr1(:,2);
bootstraps_corr2 = bootstrp(B,@corrcoef,pr2);
bootstraps_corr2 = bootstraps_corr2(:,2);

dif = bootstraps_corr1 - bootstraps_corr2;
dif = sort(dif);

CIBoot = dif(limits)'

%%  Observations, Remarks and Comments:
%
%       We see that zero belongs to the CI, thus the correlation coefficients
%           can be statistically similiar.
%