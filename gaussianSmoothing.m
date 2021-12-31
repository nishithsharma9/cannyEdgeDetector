function smoothImage = gaussianSmoothing(inputGrayscaleImage)

%add normalization to every step.
mask = gaussianMask();
maskSize = size(mask);

imageSize = size(inputGrayscaleImage);
smoothImage = zeros(imageSize(1),imageSize(2));

for i = 1+floor(maskSize(1)/2) : imageSize(1)-3
    for j = 1+floor(maskSize(2)/2): imageSize(2)-3
        window=inputGrayscaleImage((i-3):(i+3),(j-3):(j+3));
        smoothImage (i,j)=sum(sum(double(window).*(mask))/140);
    end
end
smoothImage;