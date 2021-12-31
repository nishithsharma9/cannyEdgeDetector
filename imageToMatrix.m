function imageMatrix = imageToMatrix(imagePath)

imageMatrix= imread(imagePath);
imageMatrix=double(imageMatrix);
