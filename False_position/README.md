Fasleposition is a function that allows a user to find the root of any
% function by defining it along with an upper and lower bound that the 
root
% The function can only work when the two initial guesses are on either
% side of the root or else no position can be falsified.
%   Created by Cameron Lindeman, Colorado State University, Introduction 
to
%   mechanical engineering 105 with Dr. Samuel Bechara Dr. B but not sam 
or
%   bro.
%     Inputs:
%     func- the function that the root needs to be calculated with
%     xl- the lower bound guess on the left side of the function
%     xu - the upper bound guess on the right side of the function
%     es - the stopping criteria that is specified by the user
%     maxit - the maximum iterations that the function will run until it 
cuts o$
%
%     Outputs:
%     root- the exact root of the function
%     ea - the rounding error from the actual function
%     iter - how many iterations it takes to get to the stopping criteria
