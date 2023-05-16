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

function pr = Group54Exe4Func1(country,data)

    ind = data.country == string(country);
    pr  = data.positivity_rate(ind==1);   

end