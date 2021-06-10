function g = softmax(Z)
    g =  Z./repmat(sum(Z,2),1,size(Z,2));
end
