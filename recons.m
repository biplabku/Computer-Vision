function REC= recons(x,y)
[M N]=size(x);
REC=0;
for i=1:1:M
    for j=1:1:M
        REC(i,j)=((x(i,j)+y(i,j)));
    end
end
end