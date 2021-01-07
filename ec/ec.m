clearvars;
layers = get_lenet();

% load the trained weights
load lenet.mat
%% calculate the file number
file = '../images';
% a = (dir([file,'/*.jpg'])dir([file,'/*.png']));
a = dir([file,'/*.*']);
s = size(a,1);


%% loading image
for j = 3:s                          %loop through the images in teh file
    files = fullfile(file,a(j).name);
    im = imread(files);
    bw = imbinarize(im);
    bw = imcomplement(bw);
    bw = double(bw);
    bw = rgb2gray(bw);
    bw = mat2gray(bw);
    se = strel('line',1,90);
    bw = imdilate(bw,se);

    %% bounding the image
    [label,n] = bwlabel(bw,8);
    g = regionprops(label, 'Image');


    for i = 1:n       
        [r,c] = size(g(i).Image);
        len = min(r,c);
        len = round(len*0.4);
        imc = g(i).Image;
        imc = padarray(imc, [len len], 0);
        imc_1 = imresize(imc,[28,28]);
        imc_1 = transpose(imc_1);
        imc_2(:,1) = imc_1(:);



        %% loaidng image into network

        layers{1,1}.batch_size = 1;
        [output, P] = convnet_forward(params, layers, imc_2(:,1));
        [data, idx] = max(P);
        pred = idx-1;
        subplot(5,11,i),imshow(imc)
        title("The prediction is "+ pred)
    end
    figure
end
