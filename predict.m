function [predict] = predict(x)
    % input are x; which mean testData 
    weights1File   ="weights1.dat";
    weights2File   ="weights2.dat";
    testDataFile   =x;
    
    pkg load io
    weights1   = cell2mat(csv2cell(weights1File));
    weights2   = cell2mat(csv2cell(weights2File));
    testData   = cell2mat(csv2cell(testDataFile));
    m          = rows(testData);
    
    z2=[ones(m,1) testData]*weights1';
    a2=[ones(m,1) sigmoid(z2)];
    z3=a2*weights2';
    h=sigmoid(z3);
  
    %one-hot encoding
    res = {};
    for i = 1:m
      T = h(i,:);
      res = [res ismember(T,max(T))];
    endfor

    %labels
    labels = {'AAA', 'AA', 'A', 'BBB', 'BB', 'B', 'CCC'};
    predict = {};
    for i=1:m
      P = cell2mat(res(i));
      for j = 1:7
        if P(j)==1
          predict=[predict labels(j)];
        endif
      endfor
    endfor
end