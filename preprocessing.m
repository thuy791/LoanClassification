%main purpose: preprocessing dataset into train_data and train_labels
%-----------------------------------------------
% read the data file
function  preprocessing(fileName)
   
    %Load .dat file
    pkg load io
    T = csv2cell(fileName);
    countColumns = columns(T);
    countRows = rows(T);

    % extract trainingFeatures 
    trainingFeatures = cell2mat(T(: , 2:countColumns-1));
	numLinearFeatures = size(trainingFeatures,2);

    trainingFeatures(:,size(trainingFeatures,2)) = trainingFeatures(:,size(trainingFeatures,2))/12;

	for i=1:numLinearFeatures
		trainingFeatures = [trainingFeatures(:,i).^2 trainingFeatures];
	end

    csvwrite("eTrainingFeatures.dat", trainingFeatures);
    
    %create trainLabels
    ratingLabels = T(:,countColumns);

    % create one-hot encoding labels
    trainLabels = zeros(countRows,7);
    labels = {'AAA','AA','A','BBB','BB','B','CCC'};

    for i = 1:countRows
        for j = 1:7
            exist = ismember(labels(j), ratingLabels(i,1));
            if exist==1
                trainLabels(i,j) = 1;
            break
            end
        end
    end
    csvwrite("eTrainingLabels.dat", trainLabels);
end
