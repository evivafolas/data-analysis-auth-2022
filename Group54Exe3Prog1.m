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

%%  Exercise 3

%%  Clearing

clear;
clc;
close all;

%%  Importing:

%
%       WE RETAIN ONLY THE ESSENTIAL INFORMATION FOR THE SPECIFIC USE OF THE PROGRAM, BY FILTERING THE REST OF THE DATA IN THE EXCEL FILE
%

data = readtable('ECDC-7Days-Testing.xlsx');

Countries = readtable('EuropeanCountries.xlsx');
countries = Countries.Country;

Lithuania   = data(1704:1797,:);
Greece      = readtable('FullEodyData.xlsx');

%% Lithuania Peaks

[pks,lcs] = findpeaks(Lithuania.positivity_rate);

% Week where Lithuania last picked:

week = lcs(end);

%% Greek & European PR

difference  = zeros(12,1);
bootstrap_CI= zeros(12,2);

PR          = zeros(12,1);
EuropeanPR  = zeros(12,1);

j = 1;

for i = week-11:week

    [bootstrap_CI(j,:),difference(j),PR(j),EuropeanPR(j)] = ...
        Group54Exe3Func1(Greece,i,data);

    j = j+1;

end

%% Plots

figure
t = (week-11:1:week)';
plot(t,PR)
hold on
plot(t,EuropeanPR)
grid on
xlabel('Weeks')
ylabel('PR')
title('Greek PR & European PR')
legend('Greek PR','Europe PR')

%%  Observations, Remarks and Comments:
%
%       We observe a statistical similarity spanning 5 weeks, but other than that the 2 PRs are statistically different.
%