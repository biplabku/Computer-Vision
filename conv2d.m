function cnvd= conv2d(g,imw,org_im)
[r c]=size(org_im);
tv1=0;
cnvd=zeros(r,c);
for i=1:1:r
    for j=1:1:c
        tv1=0;
        for k=1:1:5
            for l=1:1:5
                tv1= tv1 + g(k,l) * imw(i+k-1,j+l-1);
            end
        end
        cnvd(i,j)=tv1;
    end
end
cnvd=uint8(cnvd);
imshow(cnvd);
end