function thresholdImage = binaryImageThreshold(image,thresholdPercentile)

thresholdImage=image;

temp = sort(nonzeros(image));

percentileIndex = floor(length(temp)*thresholdPercentile/100);
thresholdIntensity = temp(percentileIndex);

thresholdImage(thresholdImage>thresholdIntensity) = 255;

thresholdImage(thresholdImage<=thresholdIntensity) = 0;

thresholdImage;