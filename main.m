pkg load io

% I. Preprocessing: 
% - Only do once or whenever data is changed.

% I.1. Load data & preprocessing:
%DataFile = "RawData.dat";
%preprocessing(DataFile);

% I.2. Load preprocessed training set:
trainingFeatures = load("eTrainingFeatures.dat");
trainingLabels = load("eTrainingLabels.dat");

% I.3. Determine the number of training set: 
m = size(trainingFeatures, 1);

% I.4. Add Bias node (1) to training features:
trainingFeatures = [ones(m, 1) trainingFeatures];





% II. Configuration model: 
% - 3-layer model.
numNodes = [13 7 7];
learningRate = 0.01;
regularizationRate = 0.001;
numIters = [10000]; % The number of iteration for each epoch.
numEpoches = 1; % The number of epoch.





% III. Initiate weights 'OR' load trained weights: 

% III.1. Initiate weights randomly: 
weights1 = rand(numNodes(2)-1, numNodes(1));
weights2 = rand(numNodes(3), numNodes(2));

% III.2. Load trained weights: 
%weights1 = cell2mat(csv2cell("weights1.dat"));
%weights2 = cell2mat(csv2cell("weights2.dat"));





for i = 1:numEpoches
	tic
	%learningDecreaseRate = (numEpoches + 1 - i)/numEpoches;
	learningDecreaseRate = 1;
    [weights1, weights2, learningRate, histories] = gradientDescent(m, trainingFeatures, trainingLabels, weights1, weights2, learningRate, numIters(i), regularizationRate, learningDecreaseRate);
    toc
    histories(numIters(i))

end





% IV. Save trained weights: 
% - [ADVICE]: 	Should only save weights when cost converges.
saveWeights(weights1, weights2, numNodes);





% V. Plot J: 
disp(learningRate);
plot(histories);
