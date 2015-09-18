function ixy = mutualinfo(matx, maty)

% first I have to convert matx to a prob vector
% to calculate the entropy of the matrix
% I(X,Y) = H(X) - H(X|Y) 


% H(X) - entropyX
edges = unique(matx);
histogram = histc(matx(:),edges);
totalElem = sum(histogram);
probX = histogram/totalElem;

entropyX= entropyVector(probX);

% conditional Entropy H(X|Y)
hxy = condEntropy(matx,maty);

ixy = entropyX - hxy;
end;
