%trich xuat data tu file Original_NewCompany.dat
function testData(rawtesting, rawlabels)
  %FOR DATA
    %Load .dat file
    pkg load io
    T1 = csv2cell(rawtesting);
    countColumns1 = columns(T1);

    % extract testingFeatures1 
    testingFeatures1 = cell2mat(T1(: , 2:countColumns1));

    %divide last column by 12
    testingFeatures1(:,size(testingFeatures1,2)) = testingFeatures1(:,size(testingFeatures1,2))/12;

    %save file
    csvwrite("testingData.dat", testingFeatures1);   
    
  %FOR LABELS
    pkg load io
    T2 = csv2cell(rawlabels);
    
    % extract testingFeatures2
    testingFeatures2 = T2(: , 2:2);
    
    %save file
    cell2csv("testingLabels.dat", testingFeatures2);
    
end