function result = cannyEdgeDetector(imagePath)

%% Test Commands:
% cannyEdgeDetector("Potrait.bmp")
% cannyEdgeDetector("Boat.bmp)
% cannyEdgeDetector("dog.bmp")

% Images from Brightspace(low resolution and high resolution of the same):
% cannyEdgeDetector("House.bmp")
% cannyEdgeDetector("House2.bmp)
% cannyEdgeDetector("TestPatterns.bmp"
% cannyEdgeDetector("TestPatterns2.bmp”)

%% Display Image
figure('Name','Original Image')
imshow(imagePath)

% Convert Image to Matrix
imageMatrix = imageToMatrix(imagePath);

%% Gaussian Smoothening
smoothImage = gaussianSmoothing(imageMatrix);

% Display Image
figure('Name','Gaussian Smoothening Image')
imshow(matrixToImage(normalize(smoothImage)))
        
%% Gradient Operations to Calculate Magnitude, Gx, Gy and GradientAngle
[prewittMagnitude,prewittGradientx,prewittGradienty,gradientAngle] = gradientOperations(smoothImage);

% Normalize the Components after the gradient operation to display the
% image correctly in the range of 0-255
prewittGradientx=normalize(prewittGradientx);
prewittGradienty=normalize(prewittGradienty);
prewittMagnitude=normalize(prewittMagnitude);

% Display Image
figure('Name','Prewitt Gradient X')
imshow(matrixToImage(prewittGradientx))

% Display Image
figure('Name','Prewitt Gradient Y')
imshow(matrixToImage(prewittGradienty))

% Display Image
figure('Name','Prewitt Magnitude')
imshow(matrixToImage(prewittMagnitude))

%% Non Maxima Suppression
nmsImage = floor(nonMaximaSuppression(prewittMagnitude,gradientAngle)/2);
nnmsImage=normalize(nmsImage);

%Display Image
figure('Name','NonMaximaSuppressedImage')
imshow(matrixToImage(nmsImage))

%% Thresholding
threshold25 = binaryImageThreshold(nmsImage,25);

%Display Image
figure('Name','Threshold1 25%')
imshow(matrixToImage(threshold25))

%% Thresholding
threshold50 = binaryImageThreshold(nmsImage,50);

%Display Image
figure('Name','Threshold1 50%')
imshow(matrixToImage(threshold50))

%% Thresholding
threshold75 = binaryImageThreshold(nmsImage,75);

%Display Image
figure('Name','Threshold1 75%')
imshow(matrixToImage(threshold75))