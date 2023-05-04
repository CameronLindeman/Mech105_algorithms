function [root,fx,ea,iter] = Falseposition(func,xl,xu,es,maxit)
% Fasleposition is a function that allows a user to find the root of any
% function by defining it along with an upper and lower bound that the root
% The function can only work when the two initial guesses are on either
% side of the root or else no position can be falsified.
%   Created by Cameron Lindeman, Colorado State University, Introduction to
%   mechanical engineering 105 with Dr. Samuel Bechara Dr. B but not sam or
%   bro. 
%     Inputs: 
%     func- the function that the root needs to be calculated with
%     xl- the lower bound guess on the left side of the function
%     xu - the upper bound guess on the right side of the function
%     es - the stopping criteria that is specified by the user
%     maxit - the maximum iterations that the function will run until it cuts off
% 
%     Outputs:
%     root- the exact root of the function
%     ea - the rounding error from the actual function
%     iter - how many iterations it takes to get to the stopping criteria
%     fx - where on the function the root occurs at

if nargin<3
    error('cannot calculate the root due to not enough arguements imputed')
end
if nargin<4
    es = 0.0001;% defaults specified by the problem, it is user specified
end
if nargin<5
   maxit = 200;% same thing here, number specified by user, default is 200
end

ea = 100;% setting an ea for the first guess because for zeroth guess will be 100 off
iter = 0; % this will allow for the iterations to contiually increase by one specified below
xr = xl; % defining the new in order to test it out

if func(xl)*func(xu)>0 % if there is no sign change then you can't calculate the root of the function.
    error('cannot compute due to no sign change in the roots')
end

while(1)  %dangerous but will be fixed in a couple of lines
    x_old = xr;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));% false position equation
    iter = iter+1;
    if xr~=0% if new guess is zero there cannot be any error and will skip this section
        ea = abs((xr-x_old)/xr)*100; %true approximate error
    end
    if ea<es ||iter>maxit
        break; %This break will break the entire loop if ends up true, this will break the while loop at some point 
    end
    if func(xl)*func(xr)<0 %determining which of the bounds to keep the same and which one to change
        xu = xr;
    elseif func(xl)*func(xr)>0
        xl = xr;
    end
end
%displaying the outputs of the function
root=xr
fx = func(xr)
fprintf('The root of the given function is: %f\n', root)
fprintf('the value of the function at the root is: %f\n', fx')
fprintf('The error of the function is: %f%%\n', ea')
fprintf('The number of iterations required was: %d\n', iter')

   
    
   