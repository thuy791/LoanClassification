function [J] = crossEntropyLoss(m, H, Y, weights1, weights2,regularizationRate)

    J = -(1 / m) * (Y(:)' * log(H)(:) + (1 - Y)(:)' * log(1 - H)(:));

    % Regularization:
    J += (regularizationRate / (2 * m)) * (sum(weights1(:, 2:end)(:).^2) + sum(weights2(:, 2:end)(:).^2)); % NOTE: Ignore bias.
end
