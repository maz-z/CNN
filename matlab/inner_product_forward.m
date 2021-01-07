function [output] = inner_product_forward(input, layer, param)

d = size(input.data, 1);
k = size(input.data, 2); % batch size
n = size(param.w, 2);

% Replace the following line with your implementation.

output.data=zeros([n,k]);
for i=1:k
    data = input.data(:,i);
    output.data(:,i)= transpose(param.w)*data+transpose(param.b);
end
output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;
end
