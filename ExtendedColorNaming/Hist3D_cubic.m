function out=Hist3D_cubic(inX,inY,inZ,startX,endX,startY,endY,startZ,endZ,xsteps,ysteps,zsteps,mask)
% assigns RGB values to histogram with cubic (CBC) interpolation
A1=inX(:);
A2=inY(:);
A3=inZ(:);

if(nargin<13)
    mask=ones(size(inX));
end
mask=mask(:);

stepsizeX=(endX-startX)/xsteps;
stepsizeY=(endY-startY)/ysteps;
stepsizeZ=(endZ-startZ)/zsteps;
 
numP=length(A1);
out=zeros(xsteps+1,ysteps+1,zsteps+1);

for i=1:numP
  if(mask(i)>0)
    x_pos=(A1(i)-startX)/stepsizeX;
    y_pos=(A2(i)-startY)/stepsizeY;
    z_pos=(A3(i)-startZ)/stepsizeZ;
    
    if(x_pos<.5) x_pos=.5;end                      % smaller than .5 is assigned only to first bin
    if(x_pos>xsteps-.5) x_pos=xsteps-.5001;end     % bigger than csteps-.5 is assigned only to last bin
    if(y_pos<.5) y_pos=.5;end
    if(y_pos>ysteps-.5) y_pos=ysteps-.5001;end
    if(z_pos<.5) z_pos=.5;end
    if(z_pos>zsteps-.5) z_pos=zsteps-.5001;end
    
    x_posD=floor(x_pos-.5);
    y_posD=floor(y_pos-.5);
    z_posD=floor(z_pos-.5);
    
    for(kk=z_posD:z_posD+1)
        for(ll=y_posD:y_posD+1)
            for(mm=x_posD:x_posD+1)
                out(mm+1,ll+1,kk+1)=out(mm+1,ll+1,kk+1)+(1-abs(kk+.5-z_pos))*(1-abs(ll+.5-y_pos))*(1-abs(mm+.5-x_pos));
            end
        end
    end
    
  end 
end
out=out(1:xsteps,1:ysteps,1:zsteps);