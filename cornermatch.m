function [result] = cornermatch(f,i,j,slope,threshSlope,distMin,distMax)
% Determines if there is a 2EC based on distance and slope
% 2EC matrix is formatted as [line1 line2 x y slope 1 slope2 angle]
% mo1 is the actual slope value that we have designated as slope 'out' on
% our parent point

% Calculate slope and distance between the two corner points
m = (f(j,4) - f(i,4)) / (f(j,3) - f(i,3));
d = sqrt((f(j,4) - f(i,4)).^2 + (f(j,3) - f(i,3)).^2);

% Criteria to see if the 2EC match
% Compare slope between corner points to our query slope
if abs(m-slope) <= threshSlope && d >= distMin && d <= distMax
    % If they match we calculate the out slope for this new point
    if abs(f(j,5) - m) <= abs(f(j,6) - m)
        result = f(j,6);
    else
        result = f(j,5);
    end
else
    result = [];
end
end