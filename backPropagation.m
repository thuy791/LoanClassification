function [weights1Gradients, weights2Gradients, J] = backPropagation(m, X, Y, weights1, weights2, regularizationRate)
    % X: [ones(m,1) X]

    weights1Gradients = zeros(size(weights1));
    weights2Gradients = zeros(size(weights2));

    % I. Compute activations and z:
    Z2 = X * weights1';
    A2 = [ones(m, 1) sigmoid(Z2)];
    Z3 = A2 * weights2';
    % H = sigmoid(Z3);
	H = softmax(Z3);

    J = crossEntropyLoss(m, H, Y, weights1, weights2, regularizationRate);

    % II. Back propagation:
    for i = 1:m% NOTE: Iterate each example.

        % II.1. Compute deltas:
        % delta3 = (H(i, :) - Y(i, :))';
		delta3 = -(Y(i,:).*(1-H(i,:)) + (1-Y(i,:)).*H(i,:))';
        delta2 = weights2(:, 2:end)' * delta3 .* sigmoidGradient(Z2(i, :)'); % NOTE: Bias does not change.

        % II.2. Compute weight gradients:
        weights2Gradients = weights2Gradients + delta3 * A2(i, :);
        weights1Gradients = weights1Gradients + delta2 * X(i, :);
    end

    % II.3. Mean:
    weights2Gradients = (1 / m) * weights2Gradients;
    weights1Gradients = (1 / m) * weights1Gradients;

    % III. Back propagation with regularization:
    weights2Gradients(:, 2:end) = weights2Gradients(:, 2:end) + (regularizationRate / m) * weights2(:, 2:end);
    weights1Gradients(:, 2:end) = weights1Gradients(:, 2:end) + (regularizationRate / m) * weights1(:, 2:end);
end
