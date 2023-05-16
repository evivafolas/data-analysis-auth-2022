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

function [h_parametric, h_permutation] = Group54Exe5Func1(PR1,PR2,alpha)
    
    n = length(PR1);
    
    %   Parametric test
    
    [R,P] = corrcoef(PR1,PR2);
    h_parametric = 0;
    
    if( P(1,2) < alpha )

        h_parametric = 1;
    
    end
    
    %   Random Permutation Test
    
    L = 1000;
    h_permutation = 0;
    
    r = corrcoef(PR1,PR2);
    t0 = r(1,2)*sqrt( (n-2)/(1-r(1,2)^2) );
    
    t = zeros(L,1);
    
    for j = 1:L
    
        PR1Perm = PR1;
        PR1Perm = PR1Perm(randperm(n));
        r       = corrcoef(PR1Perm,PR2);
        t(j)    = r(1,2)*sqrt( (n-2)/(1-r(1,2)^2) );  
    
    end
    
    %   Percentile
    
    t       = sort(t);
    alpha   = 5;

    percentiles = [alpha/2 (100-alpha)/2];
    
    CI = prctile(t,percentiles);
    
    %   Decision Test
    
    if( t0 < CI(1) || t0 > CI(2) )
    
        h_permutation = 1;
    
    end