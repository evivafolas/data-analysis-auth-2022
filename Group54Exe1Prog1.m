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

%%  Exercise 1

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

Countries   = readtable('EuropeanCountries.xlsx');
countries   = Countries.Country;

%% Period 1 - Timeframe: Last 6 weeks of 2020

period  = 1;
pr2020  = zeros(25,1);

for i = 1:length(countries)
    [pr2020(i),pr] = Group54Exe1Func1(countries{i},data20,period);
end

% Normal Distribution Check

figure(1);
subplot(1,2,1)
histfit(pr2020,25,'normal')
title('Histogram of PR 2020 - Normal Distribution Fit')

% Exponential Distribution Check

figure(2);
subplot(1,2,1)
histfit(pr2020,25,'exponential')
title('Histogram of PR 2021 - Exponential Distribution Fit')

% Inverse Gaussian Distribution Check
figure(3);
subplot(1,2,1)
histfit(pr2020,25,'inverse gaussian')
title('Histogram of PR 2021 - Inverse Gaussian Distribution Fit')

% Weibull Distribution Check
figure(4);
subplot(1,2,1)
histfit(pr2020,25,'weibull')
title('Histogram of PR 2021 - Weibull Distribution Fit')


%% Period 2 - Timeframe: Last 6 weeks of 2021

period = 2;
pr2021 = zeros(25,1);
for i = 1:length(countries)
    [pr2021(i),pr] = Group54Exe1Func1(countries{i},data21,period);
end

% Normal Distribution Check

figure(1)
subplot(1,2,2)
histfit(pr2021,25,'normal')
title('Histogram of PR 2020 - Normal Distribution Fit')

% Exponential Distribution Check

figure(2)
subplot(1,2,2)
histfit(pr2021,25,'exponential')
title('Histogram of PR 2020 - Exponential Distribution Fit')

% Inverse Gaussian Distribution Check

figure(3)
subplot(1,2,2)
histfit(pr2021,25,'inverse gaussian')
title('Histogram of PR 2020 - Inverse Gaussian Distribution Fit')

% Weibull Distribution Check

figure(4)
subplot(1,2,2)
histfit(pr2021,25,'weibull')
title('Histogram of PR 2020 - Weibull Distribution Fit')



%%  Observations, Remarks and Comments:
%
%       From those tested, no distribution seems to fit for both periods.
%