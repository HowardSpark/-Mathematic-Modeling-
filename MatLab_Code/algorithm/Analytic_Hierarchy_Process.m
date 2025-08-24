%% 层次分析法(AHP)
% 只有非一致矩阵才需要一致性检验
% % 要先进行一致性检验，通过后才能求权重
%% 获取判断矩阵
disp("请输入判断矩阵A")
A = input('A=');
[n,n] = size(A);
%% 方法一：算术平均法求权重
Sum_A = sum(A)
SUM_A = repmat(Sum_A,n,1);
Stand_A = A ./ SUM_A;

disp('算术平均数求权重的结果为：');
w1 = sum(Stand_A,2)./n;
disp(w1)

%% 方法二：特征值法求权重
[V,D] = eig(A);
Max_eig = max(max(D));
[r,c] = find(D == Max_eig,1);
disp('特征值求权重的结果为：');
w2 = V(:,c) ./sum(V(:,c));
disp(w2)
disp('两种方法的平均权重为：');
disp((w1 + w2) ./ 2);

%% 计算一致性比例CR
CI = (Max_eig - n) / (n - 1);
Ri = [0 0.0001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59]; %这里的RI最多支持n = 15
% 这里n = 2时，RI = 0，为了避免分母为0，将这里的第二个元素改为了很接近0的正数
CR = CI / RI(n)
disp('最大特征值为：');
disp(Max_eig);
disp('一致性指标CI=');disp(CI);
disp('一致性指标CR=');disp(CR);
if CR < 0.10
    disp('CR < 0.10，该判断矩阵A的一致性可以接受！');
else
    disp('注意：CR >= 0.10，该判断矩阵需要进行修改！');
end
