function normalizedMatrix = normalize(imageMatrix)

lo = min(min(imageMatrix));

if(lo<0)
    imageMatrix=imageMatrix+abs(lo);
end

hi=max(max(imageMatrix));
if(hi>255)
    normalizeComponent=255/hi;
    imageMatrix = imageMatrix.*normalizeComponent;
end

new_lo = min(min(imageMatrix));
new_hi = max(max(imageMatrix));
normalizedMatrix = imageMatrix;
