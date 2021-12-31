function nmsImage = nonMaximaSuppression(magnitude, gradientAngle)

sectorAngle=gradientAngle;
sectorAngle(sectorAngle>=-22.5 & sectorAngle<22.5)=0;
sectorAngle(sectorAngle>=67.5 & sectorAngle<112.5)=2;
sectorAngle(sectorAngle>=-67.5 & sectorAngle<-22.5)=3;
sectorAngle(sectorAngle>=22.5  & sectorAngle<67.5)=1;
sectorAngle(sectorAngle>=-112.5  & sectorAngle<-67.5)=2;

sizeImage = size(magnitude);
nmsImage=zeros(sizeImage);

for i=6:sizeImage(1)-6
    for j=6:sizeImage(2)-6
        if(sectorAngle(i,j)==0)
            if(magnitude(i,j)>magnitude(i,j+1) & magnitude(i,j)>magnitude(i,j-1))
                nmsImage(i,j) = magnitude(i,j);
            else
                nmsImage(i,j) = 0;
            end
        elseif(sectorAngle(i,j)==1)
            if(magnitude(i,j)>magnitude(i-1,j+1)&magnitude(i,j)>magnitude(i+1,j-1))
                nmsImage(i,j) = magnitude(i,j);
            else
                nmsImage(i,j) = 0;
            end
        elseif(sectorAngle(i,j)==2)
            if(magnitude(i,j)>magnitude(i-1,j)&magnitude(i,j)>magnitude(i+1,j))
                nmsImage(i,j) = magnitude(i,j);
            else
                nmsImage(i,j) = 0;
            end
        elseif(sectorAngle(i,j)==3)
            if(magnitude(i,j)>magnitude(i-1,j-1)&magnitude(i,j)>magnitude(i+1,j+1))
                nmsImage(i,j) = magnitude(i,j);
            else
                nmsImage(i,j) = 0;
            end
        else
            nmsImage(i,j)=0;
        end
    end
end
nmsImage;