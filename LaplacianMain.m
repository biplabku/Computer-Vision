I=imread('lena.jpg');
Im=uint8(I);
[rows, cols]=size(Im);
G=GaussFilter(5,1); % GAUSS FILTER CREATED
PadIm=PadZero(Im);  % IMAGE PADDED WITH ZEROS
Outc=conv2d(G,PadIm,Im);
Out1=uint8(Outc);
% downsampling -256
imL1= Out1(1:2:end,1:2:end);

%% level 0- Laplacian- 
UpSam=upsample(imL1);% 512
lap_0=uint8(dif_lap(UpSam,Out1));%difference  % 512 output
figure 
imshow(lap_0,[]) %%%%%%--- Level 0 output of laplacian
rec_0=0;
rec_0=uint8(recons(lap_0,UpSam));% reconstruction level 0
mserror0=mse(Out1,rec_0);
PadIm1=PadZero(imL1);
Outc1=conv2d(G,PadIm1,imL1);
Out2=uint8(Outc1);

%% level 1- Laplacian- 
imL2= Out2(1:2:end,1:2:end);%128
UpSam1=upsample(imL2); %256
lap_1=uint8(dif_lap(UpSam1,Out2));%%difference  % 256 output
figure
imshow(lap_1,[]) %%%%%%--- Level 1 output of laplacian
rec_1=0;
rec_1=uint8(recons(lap_1,UpSam1));% reconstruction level 1
mserror1=mse(Out2,rec_1);
PadIm2=PadZero(imL2);
Outc2=conv2d(G,PadIm2,imL2);
Out3=(Outc2);

%% level 2- Laplacian- 
imL3= Out3(1:2:end,1:2:end);% 64
UpSam2=upsample(imL3); %128
lap_2=uint8(dif_lap(UpSam2,Out3));%difference  % 128 output
figure
imshow(lap_2,[]) %%%%%%--- Level 2 output of laplacian
rec_2=0;
rec_2=uint8(recons(lap_2,UpSam2));% reconstruction level 2
mserror2=mse(Out3,rec_2);
PadIm3=PadZero(imL3);
Outc3=conv2d(G,PadIm3,imL3);
Out4=uint8(Outc3);

%% level 3- Laplacian- 
imL4= Out4(1:2:end,1:2:end);%32
UpSam3=upsample(imL4);%64
lap_3=uint8(dif_lap(UpSam3,Out4));%difference  % 64 output
figure
imshow(lap_3,[]) %%%%%%--- Level 3 output of laplacian
rec_3=0;
rec_3=uint8(recons(lap_3,UpSam3));% reconstruction level 3
mserror3=mse(Out4,rec_3);
PadIm4=PadZero(imL4);
Outc4=conv2d(G,PadIm4,imL4);
Out5=uint8(Outc4);



%% level 4- Laplacian-
imL5= Out5(1:2:end,1:2:end);%16
UpSam4=upsample(imL5);%32
lap_4=uint8(dif_lap(UpSam4,Out5));%difference  % 32 output
figure
imshow(lap_4,[]) %%%%%%--- Level 4 output of laplacian
rec_4=0;
rec_4=uint8(recons(lap_4,UpSam4));% reconstruction level 4
mserror4=mse(Out5,rec_4);

% PadIm5=PadZero(imL5);
% Outc5=conv2d(G,PadIm5,imL5);
% Out6=uint8(Outc5);


