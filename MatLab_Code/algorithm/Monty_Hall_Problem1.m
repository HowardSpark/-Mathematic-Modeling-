n = 100000; % n代表蒙特卡洛模拟重复次数
a = 0; % a表示不改变主意是能赢得汽车的次数
b = 0; % b表示改变主意能赢得汽车的次数
c = 0; % c表示没有得奖的次数
for i = 1:n % 开始模拟n次
    x = randi([1,3]);
    y = randi([1,3]);
    change = randi([0,1]); % 0表示不改变主意，1表示改变主意
    % 下面分两种情况讨论：x = y和x != y
    if x == y
        if change == 0
            a = a + 1;
        else 
            c = c + 1;
        end
    else
        if change == 0
            c = c + 1;
        else
            b = b + 1;
        end
    end
end
disp(['蒙特卡洛方法得到的不改变主意时的得奖概率为：', num2str(a/n)]);
disp(['蒙特卡洛方法得到的改变主意时的得奖概率为：', num2str(b/n)]);
disp(['蒙特卡洛方法没有获奖的概率为：', num2str(c/n)]);
