% hw1_24F.m
% Matlab program for Assignment #1 
% For the course, "Macroeconomic Foundations for Asset Prices," NYU Stern.
% Written by:  Stan Zin [2024-09-11]
%%
format compact 
clear all 

disp(' ')
disp('Answers to Assignment #1') 

disp(' ')
disp('------------------------------------------------------------------')
disp('Question 1a')
% mgf of the Poisson
syms omg s 
mgf =  exp(omg*(exp(s)-1))
disp(' ')
eta1 = subs(diff(mgf,s,1),s,0)    
eta2 = subs(diff(mgf,s,2),s,0)    
eta3 = subs(diff(mgf,s,3),s,0)
eta4 = subs(diff(mgf,s,4),s,0)
disp(' ')
disp('------------------------------------------------------------------')
disp('Hit any key to continue')



disp(' ')
disp('------------------------------------------------------------------')
disp('Question 1b')
% cgf of the Poisson 
cgf =  omg*(exp(s)-1)
disp(' ')
kappa1 = subs(diff(cgf,s,1),s,0)    
kappa2 = subs(diff(cgf,s,2),s,0)    
kappa3 = subs(diff(cgf,s,3),s,0)
kappa4 = subs(diff(cgf,s,4),s,0)

disp(' ')
disp('------------------------------------------------------------------')
disp('Hit any key to continue')


disp(' ')
disp(' ')
disp('------------------------------------------------------------------')
disp('Question 1f')
% central mgf of the Poisson 
mgfc =  exp(-omg*s)*exp(omg*(exp(s)-1))
disp(' ')
m1 = subs(diff(mgfc,s,1),s,0)    
m2 = subs(diff(mgfc,s,2),s,0)    
m3 = subs(diff(mgfc,s,3),s,0)
m4 = subs(diff(mgfc,s,4),s,0)
disp(' ')
disp('------------------------------------------------------------------')
disp('Hit any key to continue')


disp(' ')
disp('------------------------------------------------------------------')
disp('Question 1g') 
disp('Poisson Probabilities')
disp(' ')
omega=[.1,1,4];
for j=1:10
    % Note that to start at z=0 we need to first subtract 1 from j
    z(j)=j-1;
    for i=1:3
        p(j,i)=exp(-omega(i))*omega(i)^(j-1)/factorial(j-1);
    end
end

figure(1)
bar(z,p)
legend('\omega = 0.1','\omega = 1','\omega = 4 ')
xlabel('z')
ylabel('Prob(z)')
title('Poisson Probabilities')
hold off
print -djpeg Fig1g.jpg

disp(' ')
disp('------------------------------------------------------------------')
disp('Hit any key to continue')


disp(' ')
disp('------------------------------------------------------------------')
disp('Question 1h') 
disp('Poisson Sample')
disp(' ')
for i=1:100
    x(i)=poissrnd(1);
end

sum=zeros(10,1);
for i=1:100
 for j=1:10
  if x(i)==j-1
     sum(j)=sum(j)+1;  % count each outcome
  end;
 end;
end;
sum=sum./100; % create relative frequency

figure(2)
bar([0:9],[sum p(:,2)]) 
legend('sample estimate','true prob')
xlabel('x')
ylabel('Prob(x)')
title('Histogram of a Poisson Sample:  N=100, \omega=1')
print -djpeg Fig1h.jpg

%%

disp('Question 3') 
disp('Sample moments of a normal')
disp('Compare our calculations to Matlab functions')
disp(' ')
clear all 

% set parameters 
nobs = 200;
rng('default');
rng(1999);
z = randn(nobs,1); 

disp('(a)') 
zbar = sum(z)./nobs;
moments = sum([z (z-zbar).^2 (z-zbar).^3 (z-zbar).^4])./nobs

disp(' ') 
disp('(b)')
mean_z=[mean(z) zbar]
std_z = [std(z) sqrt(moments(2))]
compare2 = [std(z) sqrt(moments(2)*nobs/(nobs-1))]

disp(' ') 
skw_z = [skewness(z) moments(3)/moments(2)^(3/2)]

disp(' ') 
krt_z = [kurtosis(z) moments(4)/moments(2)^2]

disp(' ') 
disp('(c)')
y=20-2*z;

ybar = sum(y)./nobs
moments_y = sum([y (y-ybar).^2 (y-ybar).^3 (y-ybar).^4])./nobs
mean_y=[mean(y) ybar]
std_y = [std(y) sqrt(moments_y(2))]
compare2 = [std(y) sqrt(moments_y(2)*nobs/(nobs-1))]

disp(' ') 
skw_y = [skewness(y) moments_y(3)/moments_y(2)^(3/2)]

disp(' ') 
krt_y = [kurtosis(y) moments_y(4)/moments_y(2)^2]

disp(' ') 
disp('(d)')
nobs = 20000;
rng(1999);
x = randn(nobs,1); 
xbar = sum(x)./nobs
moments = sum([x (x-xbar).^2 (x-xbar).^3 (x-xbar).^4])./nobs
 

