function [I] = Simpsons(x,y)
%Simpsons is a function that calculates the integral of a function that is
%not continuous and can not be calculated with calculus integrals.
%   Inputs:
%   x- is an array of data points that need to be equally spaced apart
%   y- is an array of data points that is the answer for the the b array
%   data points
%   Outputs:
%   I - the integral of the data points that are provided in a function.
if length(x)~=length(y)%checking to see if the lengths of the arrays are the same
    error('both arrays need to be the same length')
end
dx = diff(x);
if max(dx)-min(dx) ~=0 %checking to see if the x array is equally spaced
    error('the x array is not equally spaced')
end
%telling the user that if the function is odd it will use the trap rule
if mod(length(x),2)==0
    warning('odd number of intervals dected, will use the trap rule for the last two segments')
end
%initial conditions
I = 0;
h = x(2)-x(1);
%using simpsons
n = length(x)-2;
I = (h/3)*(y(1)+4*sum(y(2:2:n+1))+2*sum(y(3:2:n))+y(end));
%using the trap rule at the end for an odd function
if mod(length(x),2)==0
    I =I+ (h/2)*(y(end-1)+y(end))
    disp('trap rule was used for the last interval')
end

end
