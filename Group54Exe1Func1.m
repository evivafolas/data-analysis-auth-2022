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

function [maximum,pr] = Group54Exe1Func1(cntr,data,period)

    if (period == 1)
    
        ind = data.country == string(cntr);
        pr = data.positivity_rate(ind==1);
        
        %   Lithuania Peaks at Week 6 on Period 1

        maximum = pr(6);    
    
    elseif (period == 2)
    
        ind = data.country == string(cntr);
        pr = data.positivity_rate(ind==1);
        
        %   Lithuania Peaks at Week 1 on Period 2

        maximum = pr(1);    
    
    end

end