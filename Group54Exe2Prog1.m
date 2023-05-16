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

%%  Exercise 2

%%  Clearing

clear;
clc;
close all;

%%  Importing:

%
%       WE RETAIN ONLY THE ESSENTIAL INFORMATION FOR THE SPECIFIC USE OF THE PROGRAM, BY FILTERING THE REST OF THE DATA IN THE EXCEL FILE
%

data20  = readtable('EuropePR20Ex1.xlsx');
data21  = readtable('EuropePR21Ex1.xlsx');

Countries = readtable('EuropeanCountries.xlsx');
countries = Countries.Country;

%%   Period 1 - Timeframe: Last 6 weeks of 2020

period = 1;
pr2020 = zeros(25,1);
for i = 1:length(countries)
    [pr2020(i),pr] = Group54Exe1Func1(countries{i},data20,period);
end

%%  Period 2 - Timeframe: Last 6 weeks of 2021

period  = 2;
pr2021  = zeros(25,1);

for i = 1:length(countries)
    [pr2021(i),pr] = Group54Exe1Func1(countries{i},data21,period);
end

%% Kolmogorov - Smirnov bootstrap test2

B = 1000;
[h,~] = bootstrp(1000,@kstest2,pr2020,pr2021);

fprintf('Percentage of rejection: %f', length(find(h))*100/length(h));

%%  Observations, Remarks and Comments:
%
%       The perceived rejection percaentage is ~10-15%, which can be deemed considerable. 
%