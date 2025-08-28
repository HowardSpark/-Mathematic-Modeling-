%% 非线性规划的函数
% [x.fval] = fmincon(fun,x0,A,b,Aeq,beq,;b,ub,nonlfun,option)
% x0表示给定的初始值（用行向量或者列向量表示），必须得写
% A b 表示线性不等式约束
% Aeq beq 表示线性等式约束
% fun 表示目标函数
% nunlfun 表示非线性约束的函数
% option 表示求解非线性规划使用的方法
clc,clear;
format long g

%% 例题1求解

% min f(x) = x1^2 + x2^2 - x1*x2 - 2x1 -5x2
% s.t. -(x1-1)^2 + x2 >= 0; 2x1 - 3x2 + 6 >= 0
x0 = [0 0];
A = [-2 3]; b = 6;
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1)

%% 使用其他算法对例题1求解
% Matlab默认使用的算法是'interior-point'内点法
% 使用interior point算法(内点法)
option = optimoptions('fmincon','Algorithm','interior-point')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1)
% 使用sqp算法(序列二次规划法)
option = optimoptions('fmincon','Algorithm','sqp')
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1)

%% 使用蒙特卡洛法的方法来找初始值(推荐)
clc,clear;
n = 10000000;
x1 = unifrnd(-100,100,n,1);
x2 = unifrnd(-100,100,n,1);
fmin = +inf;
for i = 1:n
    x = [x1(i),x2(i)];
    if ((x(1)-1)^2-x(2)<=0) & (-2*x1(i)+3*x2(i)-6 <= 0)
        result = x(1)^2+x(2)^2 - x(1) * x(2) - 2* x(1)- 5*x(2);
        if result < fmin
            fmin = result;
            x0 = x;
        end
    end
end
disp('蒙特卡罗选取的初始值为：');disp(x0)
A = [-2,3]; b = 6;
[x,fval] = fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1)



