function [] = saveWeights(weights1, weights2, numNodes)

    w1="";

    for i = 1:numNodes(2) - 1
        line="";

        for j = 1:numNodes(1)
            line = strcat(line, ',', num2str(weights1(i, j)));
        end

        w1 = strcat(w1, line(:, 2:end));
        w1 = strcat(w1, "\n");
    end

    filename = "eweights1.dat";
    fid = fopen (filename, "w");
    fputs (fid, w1);
    fclose (fid);

    w2="";

    for i = 1:numNodes(3)
        line="";

        for j = 1:numNodes(2)
            line = strcat(line, ',', num2str(weights2(i, j)));
        end

        w2 = strcat(w2, line(:, 2:end));
        w2 = strcat(w2, "\n");
    end

    filename = "eweights2.dat";
    fid = fopen (filename, "w");
    fputs (fid, w2);
    fclose (fid);
end
