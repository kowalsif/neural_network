in=[0 1 2 3];
w1 = [0 0 0 0; 1 1 1 1; 2 2 2 2; 3 3 3 3];
w2 = [0 0 0 0; -1 -1 -1 -1; -2 -2 -2 -2; -3 -3 -3 -3];
w3 = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];

for i = 1:4
    sum1(i) = sum(in.*2.^w1(i,:));
    e1(i) = floor((sum1(i)*2^2)/(1+abs(sum1(i)*2^-5)));
end

for i = 1:4
    sum2(i) = sum(e1.*2.^w2(i,:));
    e2(i) = floor((sum2(i)*2^2)/(1+abs(sum2(i)*2^-5)));
end

for i = 1:4
    sum3(i) = sum(e2.*2.^w3(i,:));
end

sum1
e1
sum2
e2
sum3