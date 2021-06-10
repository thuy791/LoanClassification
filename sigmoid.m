function g = sigmoid(Z)
    g = 1.0 ./ (1.0 + exp(-Z));
end
