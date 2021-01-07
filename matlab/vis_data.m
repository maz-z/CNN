layers = get_lenet();
load lenet.mat
% load data
% Change the following value to true to load the entire dataset.
fullset = false;
[xtrain, ytrain, xvalidate, yvalidate, xtest, ytest] = load_mnist(fullset);
xtrain = [xtrain, xvalidate];
ytrain = [ytrain, yvalidate];
m_train = size(xtrain, 2);
batch_size = 64;
 
 
layers{1}.batch_size = 1;
img = xtest(:, 1);
img = reshape(img, 28, 28);
imshow(img')
 
%[cp, ~, output] = conv_net_output(params, layers, xtest(:, 1), ytest(:, 1));
output = convnet_forward(params, layers, xtest(:, 1));
disp(output)
output_1 = reshape(output{1}.data, 28, 28);
layer2 = output{1,2}.data;
layer3 = output{1,3}.data;
j = 1;
k = 1;
% Fill in your code here to plot the features.
max_2 = max(layer2);
min_2 = min(layer2);

for i = 1:576:size(layer2(:,1))
    output_2 = reshape(layer2(i:i+575,1), 24,24);
    output_2 = transpose(output_2);
    subplot(4,5,j),imshow(output_2)
    j = j+1;
end
figure

layer3 = (layer3-min_2)/(max_2-min_2);
for i = 1:576:size(layer2(:,1))
    output_3 = reshape(layer3(i:i+575,1), 24,24);
    output_3 = transpose(output_3);
    subplot(4,5,k),imshow(output_3)
    k = k+1;
end

% output_2 = reshape(output{1}.data, 28, 28);



