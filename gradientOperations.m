function [magnitude, gradientx, gradienty, angle] = gradientOperations(inputImageMatrix)

image = inputImageMatrix;
sizeImage = size(image);
gradientx = zeros(sizeImage);
gradienty = zeros(sizeImage);
for i=5:sizeImage(1)-5
    for j=5:sizeImage(2)-5
        gradientx(i,j)=image(i-1,j+1)-image(i-1,j-1)+image(i,j+1)-image(i,j-1)+image(i+1,j+1)-image(i+1,j-1);
        gradienty(i,j)=image(i-1,j-1)-image(i+1,j-1)+image(i-1,j)-image(i+1,j)+image(i-1,j+1)-image(i+1,j+1);
    end
end

prewittmagnitude = abs(gradientx)+abs(gradienty);
prewittangle = gradienty./gradientx;

magnitude=prewittmagnitude;
gradientx;
gradienty;
angle=rad2deg(atan(prewittangle));
