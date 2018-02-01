function [out,out2]=im2cLAB2_test(im,w2cBLall,color,selected)
%% function discription
% color=0 is color names out
% color=-1 is colored image with color names out
% color=1-11 is prob of colorname=color out;
% color=12 is prob of max colorname out

%% original color values 
%  beige,    burgundy,   cyan, fuchsia,  lavender,      lilac,   magenta, maroon,    mauve,      ochre,     
%  olive,     peach,       plum,         rose,         salmon,        tan,       teal,    turquoise,     violet,  
%  lime green , light green, dark green, dark purple,   light blue,   mustard,   olive green,pale yellow, mint green                                                                                                                                                  turquoise,    olive green,    mint green,     burgundy ,  lavender,magenta,    salmon  , cyan,      beige  ,     rose      ,dark green,  olive,      lilac ,   pale yellow.                                     

orignial_values={ [0 0 0] ,  [.65 .32 .17] , [0 0 1] , [.5 .5 .5] , [0 1 0] ,[1 .5 0] , [1 .65 .85] , [.75 0 .75] , [1 0 0] , [1 1 1 ] , [ 1 1 0 ], ...
    [.96 .96 .86],[.55 0 .1],[0 1 1],[1 0 0.5],[.9 .9 .98],[.78 .64 .78],[1 0 1],[0.5 0 0],[.8 .6 1],[.8 .47 .13],[.5 .5 0],[1 .85 .73],[.87 .63 .87], ...
    [.94 .35 .48],[.99 .76 .74],[.82 .71 .55],[0 .5 .5],[.25 .88 .82],[.93 .51 .93],[.2 .8 .2], [.56 .93 .56], [0 .39,0], [.33 .1 .55], [1 1 .2],[1 .91 .38], ...
    [.33 .42 .18],[1 1 .88], [.24 .39 .24]};%before:salmon [.98 .5 .45] pale yellow [.68 .85 .9]
for i=1:size(selected,2)
color_values{1,i} =  orignial_values{1,selected(1,i)};
end

%%  Choose different output modes

if(nargin<3)
    color=0;
end

[LL,AA,BB]=rgb2lab_im(im);

index_im = 1+floor( LL/5)+20*(floor( AA/5)+21)+20*42*(floor( BB/5)+21);
%hist1=Hist3D_cubic(LL,AA,BB,-5,95,-105,105,-105,105,20,42,42,mask);

if(color==-1)
    out=im;
    [~,w2cBL]=max(w2cBLall,[],2);
    out2=reshape(w2cBL(index_im(:)),size(im,1),size(im,2));
    
    for jj=1:size(im,1)
        for ii=1:size(im,2)
            hist1=Hist3D_cubic(LL(jj,ii),AA(jj,ii),BB(jj,ii),-5,95,-105,105,-105,105,20,42,42);
            CN=hist1(hist1>0)'*w2cBLall(hist1>0,:);
            [~,index1]=max(CN);
     
            out(jj,ii,:)=color_values{index1}';
        end
    end
end

if(color>0 && color<40)
    out=zeros(size(im,1),size(im,2));
    [~,w2cBL]=max(w2cBLall,[],2);
    out2=reshape(w2cBL(index_im(:)),size(im,1),size(im,2));
    
    for jj=1:size(im,1)
        for ii=1:size(im,2)
            hist1=Hist3D_cubic(LL(jj,ii),AA(jj,ii),BB(jj,ii),-5,95,-105,105,-105,105,20,42,42);
            CN=hist1(hist1>0)'*w2cBLall(hist1>0,:);
     
            out(jj,ii)=CN(color);
        end
    end
end

if(color>40)
   [max1,~]=max(w2cBLall,[],2);
   out=reshape(max1(index_im(:)),size(im,1),size(im,2));
end