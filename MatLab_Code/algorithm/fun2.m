function ff = fun2(x)
a1 = [1.25 8.75 0.5 5.75 3 7.25];
b1 = [1.25 0.75 4.75 5 6.5 7.25];

f1 = 0;

for i=1:6
    s(i)=sqrt((x(13)-a1(i))^2+(x(14)-b1(i))^2);
    f1 = s(i)*x(i) + f1;
end

f2 = 0;

for i=7:12
    s(i)=sqrt((x(15)-a1(i-6))^2+(x(16)-b1(i-6))^2);
    f2 = s(i)*x(i) + f2;
end
% 总运输量(吨千米数)
ff = f1+f2;
end
