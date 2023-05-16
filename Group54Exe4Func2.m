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

function CIBoot = Group54Exe4Func2(PR1,PR2,B)

    alpha = 0.05;

    lowerLim = (B+1) * alpha / 2;
    upperLim = B + 1 - lowerLim;

    limits = [lowerLim upperLim];
    limits = floor(limits);

    CIBoot = zeros(1,2);
    bootsX = bootstrp(B,@mean,PR1);
    bootsY = bootstrp(B,@mean,PR2);
    
    dif = bootsX - bootsY;
    dif = sort(dif);
    
    CIBoot(1,:) = dif(limits);

end