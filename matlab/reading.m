clc;
clearvars;
layers = get_lenet();
file = '../img';
a = dir([file,'/*.jpg']);
n = size(a,1);
layers{1,1}.batch_size = n;
for i = 1:n
    file = '../img';
    a = dir([file,'/*.jpg']);
    files = fullfile(file,a(i).name);
    A = imread(files);
    A = mat2gray(A);
    A = double(imresize(A,[28,28]));
    A = rgb2gray(A);
    A = transpose(A);
    A = imcomplement(A);
    input(:,i) = A(:);
%     disp(size(input))
end
% disp(size(A))
% disp(size(input(:,5)))

% load the trained weights
load lenet.mat
%load images as xtest
% A = imread(a(1).name);
% A = mat2gray(A);
% A = double(imresize(A,[28,28]));
% A = rgb2gray(A);
% imshow(A);

% disp(size(input,2))
% [output, P] = convnet_forward(params, layers, input(:,n));
% [data, idx] = max(P);
% disp(P)

[output, P] = convnet_forward(params, layers, input(:,1:n));
[data, idx] = max(P);
disp(idx-1)

