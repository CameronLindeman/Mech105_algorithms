function [fX,fY,slope, intercept,Rsquared] = linearRegression(x,y)
%linearRegression : linear regression of a data set
%   [a,r2] = linreg(x,y): the sum of the squares of the residuals around
%   the mean of the data set
% input:
%     x = independent variable
%     y = dependent variable
% output:
%     a = vector of slope, a(1), and intercept, a(2)
%     r2 = coeffiecient of determination
n = length(y);
if length(y)~=n
    disp('x and y must have the same length')
end
%sorting the data
[sortedY, sortOrder]= sort(y);
sortedX = x(sortOrder);
%computing the quartiles

n = length(x);
Q1i = floor(0.25*n)+1;
Q3i = floor(0.75*n)+1;
Q1 = sortedY(Q1i);
Q3 = sortedY(Q3i);
IQR = Q3-Q1;

%removing the outliers
lower = Q1 - 1.5*IQR;
upper = Q3 + 1.5*IQR;
outlier = (y<lower)|(y>upper);
fX = sortedX(~outlier);
fY = sortedY(~outlier);

%linear regression of the sorted data

xMean = mean(fX);
yMean = mean(fY);
sxx = sum((fX-xMean).^2);
sxy = sum((fX-xMean).*(fY-yMean));
m = sxy/sxx;
b = yMean-m*xMean;
%computing Rsquared
yp = m*fX+b;
ssr = sum((fY-yp).^2);
sst = sum*fy-yMean).^2);
rsquared = 1 - ssr/sst;
intercept = b;
slope = m;
