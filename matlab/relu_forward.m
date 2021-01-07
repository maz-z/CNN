function [output] = relu_forward(input)
output.height = input.height;
output.width = input.width;
output.channel = input.channel;
output.batch_size = input.batch_size;
output.batch_size = output.batch_size;

% Replace the following line with your implementation.
output.data = zeros(size(input.data));
for i = 1:input.batch_size
    for j = 1:size(input.data(:,i))
        data = input.data(j,i);
        if data>0
            output.data(j,i) = data;
        end
    end
end
end
