 bisect: root location zeros
%   [root,fx,ea,iter] = bisect(func,xl,xu,es,maxit, p1,p1...):
%       Uses bisection method to find the root of the function
% Input:
%   func = name of function
%   xl,xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1,p2,.... = additional parameters used by func
%output:
%   root = root estimate
%   fx = function value at root estimate
%   ea = approximate relative error (%)
%   iter = number of iterations

