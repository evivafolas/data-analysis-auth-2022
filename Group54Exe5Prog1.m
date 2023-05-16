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

%%  Exercise 4

%%  Clearing

clear;
clc;
close all;

%%  Importing:

%
%       WE RETAIN ONLY THE ESSENTIAL INFORMATION FOR THE SPECIFIC USE OF THE PROGRAM, BY FILTERING THE REST OF THE DATA IN THE EXCEL FILE
%

data21      = readtable('EuropeanPR21Ex5.xlsx');

Countries   = readtable('EuropeanCountries.xlsx');
countries   = Countries.Country;

Ireland_PR_2021     = Group54Exe4Func1('Ireland',data21);
Iceland_PR_2021     = Group54Exe4Func1('Iceland',data21);
Lithuania_PR_2021   = Group54Exe4Func1('Lithuania',data21);
Netherlands_PR_2021 = Group54Exe4Func1('Netherlands',data21);
Norway_PR_2021      = Group54Exe4Func1('Norway',data21);
Greece_PR_2021      = Group54Exe4Func1('Greece',data21);

% Normalization

Ireland_PR_2021_norm    = normalize(Ireland_PR_2021);
Greece_PR_2021_norm     = normalize(Greece_PR_2021);
Iceland_PR_2021_norm    = normalize(Iceland_PR_2021);
Lithuania_PR_2021_norm  = normalize(Lithuania_PR_2021);
Netherlands_PR_2021_norm= normalize(Netherlands_PR_2021);
Norway_PR_2021_norm     = normalize(Norway_PR_2021);

%%  Data Plots

figure
plot(Ireland_PR_2021_norm)
hold on
plot(Greece_PR_2021_norm)
plot(Iceland_PR_2021_norm)
plot(Lithuania_PR_2021_norm)
plot(Netherlands_PR_2021_norm)
plot(Norway_PR_2021_norm)
legend('Ireland','Greece','Iceland','Lithuania','Netherlands','Norway')
title('Normalized PRs')

%% Checking Greek Correlation:

alpha = 0.05;

[Ireland_h_param,Ireland_h_perm]        = Group54Exe5Func1(Ireland_PR_2021,Greece_PR_2021,alpha);
[Iceland_h_param,Iceland_h_perm]        = Group54Exe5Func1(Iceland_PR_2021,Greece_PR_2021,alpha);
[Lithuania_h_param,Lithuania_h_perm]    = Group54Exe5Func1(Lithuania_PR_2021,Greece_PR_2021,alpha);
[Netherlands_h_param,Netherlands_h_perm]= Group54Exe5Func1(Netherlands_PR_2021,Greece_PR_2021,alpha);
[Norway_h_param,Norway_h_perm]          = Group54Exe5Func1(Norway_PR_2021,Greece_PR_2021,alpha);

h_parametric_95     = [Ireland_h_param,Iceland_h_param,Lithuania_h_param,Netherlands_h_param,Norway_h_param]
h_permutation_95    = [Ireland_h_perm,Iceland_h_perm,Lithuania_h_perm,Netherlands_h_perm,Norway_h_perm]

alpha = 0.01;

[Ireland_h_param,Ireland_h_perm]        = Group54Exe5Func1(Ireland_PR_2021,Greece_PR_2021,alpha);
[Iceland_h_param,Iceland_h_perm]        = Group54Exe5Func1(Iceland_PR_2021,Greece_PR_2021,alpha);
[Lithuania_h_param,Lithuania_h_perm]    = Group54Exe5Func1(Lithuania_PR_2021,Greece_PR_2021,alpha);
[Netherlands_h_param,Netherlands_h_perm]= Group54Exe5Func1(Netherlands_PR_2021,Greece_PR_2021,alpha);
[Norway_h_param,Norway_h_perm]          = Group54Exe5Func1(Norway_PR_2021,Greece_PR_2021,alpha);

h_parametric_99     = [Ireland_h_param,Iceland_h_param,Lithuania_h_param,Netherlands_h_param,Norway_h_param]
h_permutation_99    = [Ireland_h_perm,Iceland_h_perm,Lithuania_h_perm,Netherlands_h_perm,Norway_h_perm]

%% Correlation Coefficient

R1 = corrcoef(Ireland_PR_2021,Greece_PR_2021);
R2 = corrcoef(Iceland_PR_2021,Greece_PR_2021);
R3 = corrcoef(Lithuania_PR_2021,Greece_PR_2021);
R4 = corrcoef(Netherlands_PR_2021,Greece_PR_2021);
R5 = corrcoef(Norway_PR_2021,Greece_PR_2021);
R = [R1(1,2); R2(1,2); R3(1,2); R4(1,2); R5(1,2)]

%%  Observations, Remarks and Comments:
%
%       We can observe that there is no apparent strong correlation between any of the 
%           tested countries and Greece. 
%       Since the parametric tests tend to falsly reject the null hypothesis, the 2 tests
%           disagree on some instances.
%       The Parametric Test offers a more accurate outcome.
%