function mask = gaussianMask()

mask = [1 1 2  2 2 1 1;
        1 2 2  4 2 2 1;
        2 2 4  8 4 2 2;
        2 4 8 16 8 4 2;
        2 2 4  8 4 2 2;
        1 2 2  4 2 2 1;
        1 1 2  2 2 1 1;];