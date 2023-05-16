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

function [bootstrap_CI,difference,PR,EuropeanPR] = Group54Exe3Func1(country,week,data)

    %   Weekly Cases

    tStart  = week * 7 - 12 * 7 - 3;
    tEnd    = (week + 1) * 7 - 12 * 7 - 3 - 1;

    new_cases   = country.NewCases(tStart:tEnd);
    weekCases   = sum(new_cases);
    
    %   Weekly Tests Finder

    RapidTests = country.Rapid_Tests(tEnd)-country.Rapid_Tests(tStart);
    PCRs = country.PCR_Tests(tEnd)-country.PCR_Tests(tStart);
    
    %   Rapid Tests started after a certain amount after, preceeding that, we only had PCR Tests.

    if isnan(RapidTests)

        RapidTests = 0;
        PR = weekCases/(PCRs+RapidTests)*100;

    else

        PR = weekCases/(PCRs+RapidTests)*100;

    end
    
    PCRgr   = zeros(7,1);
    Rapidgr = zeros(7,1);
    
    %   Daily Tests - Week Iterations

    for i=1:7

        Rapidgr(i) = country.Rapid_Tests(tEnd-(7-i))-...
            country.Rapid_Tests(tEnd-(7-i+1));

        PCRgr(i) = country.PCR_Tests(tEnd-(7-i))-...
            country.PCR_Tests(tEnd-(7-i+1));

    end
    
    %   Daily PRs

    prGr = new_cases./(PCRgr+Rapidgr)*100;
    
    %   Bootstrap CI for mean PosRate

    bootstrap_CI = bootci(1000,@mean,prGr)';
    
    % European PR at Specific Timepoint

    if week > 52

        s = '2021-W'+string(week-52);

    else

        s = '2020-W'+string(week);

    end

    ind = data.year_week == s;
    prs = nonzeros(data.positivity_rate(ind==1));

    EuropeanPR = sum(prs)/25;
    
    % CI Check

    if EuropeanPR>bootstrap_CI(2)

        difference = EuropeanPR-bootstrap_CI(2);

    elseif EuropeanPR<bootstrap_CI(1)

        difference = EuropeanPR-bootstrap_CI(1);

    else

        difference = 0;

    end
    
end