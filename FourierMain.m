i1=imread('lena.jpg');
i2=imresize(i1,[64 64]);  %% we can Use this code for this imresize- imL1= Out1(1:2:end,1:2:end); I have used
i2=im2uint8(i2);% this code in the other question. To make it simple i have used this inbuilt function here
f=double(i2);
[M N]=size(f);
fk=0;
var_1=0;
var=0;
for u=1:N
    for v=1:N
        var_2=0;
        for m=1:N
            for n=1:N
                var=f(m,n) * exp(-2*3.14*1i*(u*m+v*n)/N)/N;
                var_1=sum(var);
                var_2=var_1+var_2;
            end
        end
        fk(u,v)=var_2;
    end
end
imshow(log(1 + abs(fk)),[])
figure
sd=255*log(1 + abs(fk));
sd1=shft2dft(sd);
imshow(sd1,[]);
figure
imshow(fk)

%% computing inverse fourier transform 
v1=0;
vr=0;
f_ab=0;
for a=1:N
    for b=1:N
        v2=0;
        for k=1:N
            for l=1:N
                vr=fk(k,l) * exp(2*3.14*1i*(a*k+l*b)/N);
                v1=sum(vr);
                v2=v1+v2;
            end
        end
        f_ab(a,b)=v2;
    end
end
fab=f_ab/N^2;
figure
imshow(fab,[]);

%% computing the mean square error of the image and the fourier transform of the image
%% between the original and reconstructed image
MSE=0;
tmpv=0;
for i=1:1:M
    for j=1:1:M
        tmpv= tmpv + (fab(i,j)-f(i,j))^2;
    end
    MSE=tmpv+MSE;
end
% taking the average to calculate the mean square error of the
% reconstructed image to that of the original image.
MSE=abs(MSE);
