function [accuracy] = accuracy(x,y)
    % input are x, y; which mean testData and testLabels
    predictAns = predict(x);
    
    %load testLabels file
    testLabelsFile =y;
    pkg load io
    testLabels = csv2cell(testLabelsFile);
    m = rows(testLabels);
    
    %calculate accuracy
    trueCount = 0;
    for i = 1: m
      if (ismember(predictAns(i),testLabels(i)) == 1 )
        trueCount = trueCount +1;
      endif
    endfor
    accuracy = trueCount/m;
end