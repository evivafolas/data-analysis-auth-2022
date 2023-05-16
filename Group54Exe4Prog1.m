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

data20 = readtable('EuropeanPR20Ex4.xlsx');
data21 = readtable('EuropeanPR21Ex4.xlsx');

Countries = readtable('EuropeanCountries.xlsx');
countries = Countries.Country;

%%  Comparison between the 2 Periods

%   Period 1

Ireland_PR_2020     = Group54Exe4Func1('Ireland',data20);
Iceland_PR_2020     = Group54Exe4Func1('Iceland',data20);
Lithuania_PR_2020   = Group54Exe4Func1('Lithuania',data20);
Netherlands_PR_2020 = Group54Exe4Func1('Netherlands',data20);
Norway_PR_2020      = Group54Exe4Func1('Norway',data20);

%   Period 2

Ireland_PR_2021     = Group54Exe4Func1('Ireland',data21);
Iceland_PR_2021     = Group54Exe4Func1('Iceland',data21);
Lithuania_PR_2021   = Group54Exe4Func1('Lithuania',data21);
Netherlands_PR_2021 = Group54Exe4Func1('Netherlands',data21);
Norway_PR_2021      = Group54Exe4Func1('Norway',data21);

%%  Data Plot

figure

subplot(1,5,1)
plot(Ireland_PR_2020)
hold on
plot(Ireland_PR_2021)
ylabel('PR')
xlabel('Weeks')
legend('IrelandPR2020','IrelandPR2021')
title('Ireland: 2020 vs 2021')

subplot(1,5,2)
plot(Ireland_PR_2020)
hold on
plot(Ireland_PR_2021)
ylabel('PR')
xlabel('Weeks')
legend('IcelandPR2020','IcelandPR2021')
title('Iceland: 2020 vs 2021')

subplot(1,5,3)
plot(Lithuania_PR_2020)
hold on
plot(Lithuania_PR_2021)
ylabel('PR')
xlabel('Weeks')
legend('LithuaniaPR2020','LithuaniaPR2021')
title('Lithuania: 2020 vs 2021')

subplot(1,5,4)
plot(Netherlands_PR_2020)
hold on
plot(Netherlands_PR_2021)
ylabel('PR')
xlabel('Weeks')
legend('NetherlandsPR2020','NetherlandsPR2021')
title('Netherlands: 2020 vs 2021')

subplot(1,5,5)
plot(Norway_PR_2020)
hold on
plot(Norway_PR_2021)
ylabel('PR')
xlabel('Weeks')
legend('NorwayPR2020','NorwayPR2021')
title('Norway: 2020 vs 2021')

%% Parametric test

[h_Ireland,p_Ireland,CI_Ireland] = ttest2(Ireland_PR_2020,Ireland_PR_2021)
[h_Iceland,p_Iceland,CI_Iceland] = ttest2(Iceland_PR_2020,Iceland_PR_2021)
[h_Lithuania,p_Lithuania,CI_Lithuania] = ttest2(Lithuania_PR_2020,Lithuania_PR_2021)
[h_Netherlands,p_Netherlands,CI_Netherlands] = ttest2(Netherlands_PR_2020,Netherlands_PR_2021)
[h_Norway,p_Norway,CI_Norway] = ttest2(Norway_PR_2020,Norway_PR_2021)

%% Bootstrap test

B = 1000;
CIBootIreland = Group54Exe4Func2(Ireland_PR_2020,Ireland_PR_2021,B)
CIBootIceland = Group54Exe4Func2(Iceland_PR_2020,Iceland_PR_2021,B)
CIBootLithuania = Group54Exe4Func2(Lithuania_PR_2020,Lithuania_PR_2021,B)
CIBootNether = Group54Exe4Func2(Netherlands_PR_2020,Netherlands_PR_2021,B)
CIBootNorway = Group54Exe4Func2(Norway_PR_2020,Norway_PR_2021,B)

%%  Observations, Remarks and Comments:
%
%       The only country observed to have zero inside the confidence interval is Lithuania.
%           The same is found through the parametric and bootstrap tests.
%
