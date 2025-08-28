%% 1.判断是否需要正向化
% A = [9 10 175 120;8 7 164 80;6 3 157 90]
X = input('指标矩阵A=');
[n,m] = size(X);
disp(['共有' num2str(n) '个评价对象，' num2str(m) '个评价指标'])
Judge = input(['这' num2str(m) '个指标是否需要经过正向化处理，需要输入1,不需要输入0：']);

if Judge == 1
    Position = input('请输入需要正向化处理的指标所在的列，例如第2、3、6三列需要处理，那么你需要输入[2,3,6]:  ');%[]
    disp('请输入需要正向化处理的指标类型(1：极小型，2：中间型，3：区间型)  ')
    Type = input('例如：第2列是极小型，第3列是区间型，第6列是中间型，就输入[1,3,2]:   ');%[2,1,3]
    % 注意，Position和Type是两个维度的行向量
    for i = 1 : size(Position,2) %这里需要对这些列分别处理，因此我们需要知道一共要处理的次数，即
        % 循环的次数
        X(:,Position(i)) = Positivization(X(:,Position(i)),Type(i),Position(i));
    % Posivization是我们自己定义的函数，其作用是进行正向化，其一共接受3个参数
    % 第一个参数是要正向化处理的那一列向量X(:,Position(i))  其中X(:,n)表示取第n列的全部元素
    % 第二个参数是对应的这一列的指标类型(1:极小型，2：中间型，3：区间型)
    % 第三个参数是告诉函数我们正在处理的是原始矩阵中的哪一列
    % 该函数有一个返回值，它返回正向化之后的指标，我们可以将其直接赋值给我们原始要处理的那一列向量
    end
    disp('正向化后的矩阵 X = ')
    disp(X)
end

%% 对正向化后的矩阵进行预处理
Mean = mean(X);
Z = X ./ repmat(Mean,size(X,1),1);
disp('预处理后的矩阵为：');
disp(Z)

%% 构造母序列和子序列
Y = max(Z,[],2);
X = Z;

%% 计算得分
absX0_Xi = abs(X - repmat(Y,1,size(X,2)))   % 计算|X0 - Xi|矩阵
a = min(min(absX0_Xi))   % 两极最小差a
b = max(max(absX0_Xi))   % 两极最大差b
rho = 0.5;   % 分辨系数一般取0.5
gamma = (a + rho*b) ./ (absX0_Xi + rho*b)
weight = mean(gamma) / sum(mean(gamma));
score = sum(X .* repmat(weight,size(X,1),1),2);
stand_S = score / sum(score);
[sorted_S,index] = sort(stand_S, 'descend')