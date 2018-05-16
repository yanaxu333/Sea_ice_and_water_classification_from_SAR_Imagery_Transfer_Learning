clear
clc
close all;
%imshow(IA)
filename = '20140131_215240'

SAR=imread(['/home/lein/yan2/raw date/hhv/' filename '-HH-8by8-mat.tif']);
name=importdata('/home/lein/yan2/samples/name/name_17.mat');
pred=importdata('/home/lein/yan2/prob_map/prob_17.mat')';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ii=1:size(pred)
    
    char=name(ii,:);
    
    schar=char(19:22);
   
    if schar(2)=='.'
        schar(2)=' ';
        schar(3)=' ';
        schar(4)=' ';
    end;
    if schar(3)=='.'
        schar(3)=' ';
        schar(4)=' ';
    end;
    if schar(4)=='.'
       schar(4)=' ';
    end;
    q(ii,:)=schar;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:size(pred)
  ww=q(ii,:);
    www=str2num(ww);
    qq(ii,:)=www;
    if pred(ii) <= 0.3;
        pred(ii) = 0;
    else
        pred(ii) = 1;
        
    end
    
C(ii,1)=qq(ii,1);
C(ii,2)=pred(ii,1);%C contains ice probability and patch number.

end;

CC= sortrows(C);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(SAR);
% pred_im=zeros(m,n);
% pred_im(:,:)=100;

    ct=0;
for i1=45:20:m-45
    for j1=45:20:n-45
        ct=ct+1;
       
  E(ct,1)=i1;
  E(ct,2)=j1;
    end;
end;

SAR(1:45,:)=100;
SAR(m-45:m,:)=100;
 SAR(:,1:45)=100;
 SAR(:,n-45:n)=100;

ImSAR=[];
ImSAR(:,:,1)=SAR;
ImSAR(:,:,2)=SAR;
ImSAR(:,:,3)=SAR;

f1=figure;
imshow(uint8(ImSAR));

hold on;
CC(579,:)=[];


for i2=1:size(CC, 1)
    
    
    CC(i2,3)=E(CC(i2,1),1);
    CC(i2,4)=E(CC(i2,1),2);
    row=CC(i2,3);
    column= CC(i2,4);
    
    
end;
a2=50;

scatter(CC(:,4),CC(:,3),a2, CC(:,2))
colormap('jet')%image boundary
cd /home/lein/Dropbox/uw/figures
%saveas(f1,[filename '_pred_icewater_bad1.jpg'])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
