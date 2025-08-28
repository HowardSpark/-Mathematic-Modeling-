%% 灰色关联分析用于系统分析
% A = [55 24 10;65 38 22;75 40 18;100 50 20]
A = input('请输入初始矩阵=')   % 请输入初始矩阵
Mean = mean(A);   % 求出每一列的均值以供后续的数据预处理
A = A ./ repmat(Mean,size(A,1),1);
disp('预处理后的矩阵为：');
disp(A)
Y = A(:,1);   % 母序列
X = A(:,2:end);   % 子序列
absX0_Xi = abs(X - repmat(Y,1,size(X,2)))   % 计算|X0 - Xi|矩阵
a = min(min(absX0_Xi))   % 两极最小差a
b = max(max(absX0_Xi))   % 两极最大差b
rho = 0.5;   % 分辨系数一般取0.5
gamma = (a + rho*b) ./ (absX0_Xi + rho*b)
disp('子序列中各个指标的灰色关联度分别为：')
disp(mean(gamma))