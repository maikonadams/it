% first loading a picture

pic = imread('me2.jpg');

% to make easier to work I will work with a gray level

pic2 = (pic(:,:,1) + pic(:,:,2) + pic(:,:,3))/3;

[row, col] = size(pic2);

%imshow(pic2);

noise = randi([0 2],row,col);

%figure;
%imshow(picnoise);

picnoise = pic2 + noise;

%figure;
%imshow(picnoise);

mutualinfo(pic2,picnoise)


