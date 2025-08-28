load data1.mat
[n,p]=size(x);

%% 第一步：对数据x标准化为X
X = zscore(x);

%% 第二步：计算样本协方差矩阵
R = cov(X);

%% 第三步：计算R的特征值和特征向量
% 注意：R是半正定矩阵，所以其特征值不为负数
% R同时是对称矩阵，Matlalb计算对称矩阵时，会将特征值按照从小到大排列
% eig用于求矩阵的特征值
[V,D]=eig(R);

%% 第四步：计算主成分贡献率和累计贡献率
lambda = diag(D); % diag函数用于得到一个矩阵的主对角线元素值(返回的是列向量)
lambda = lambda(end:-1:1); % lambda向量是从小到大排列的，我们将其调转
contribution_rate = lambda / sum(lambda);
cum_contribution_late = cumsum(lambda) / sum(lambda);
disp('特征值为：')
disp(lambda) % 转置为行向量，方便展示
disp('贡献率为：')
disp(contribution_rate)
disp('累计贡献率为：')
disp(cum_contribution_late)
disp('与特征值对应的特征向量矩阵为：')
% 注意：这里的特征向量要和特征值一一对应，之前特征值相当于颠倒过来了，因此特征向量的各列需要颠倒过来
% rot90函数可以使一个矩阵逆时针旋转90度，然后在转置，就可以实现将矩阵的列颠倒的效果。
V=rot90(V)';
disp(V);