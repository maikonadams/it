function [jointMat, marginX, marginY] = jointProbab(matW, matE)
% trying to give back the joint probabily of two matrices 

% first is to understand the matX and matY , 
% know the range and number of different elements

% using unique which
[rowX, colX] = size(matW);
[rowY, colY] = size(matE);

if (rowX ~= rowY) || (colX ~= colY)
    error('matrixes has to have the same dimensions');
end;
uniqueX = unique(matW);
uniqueY = unique(matE);
numOfElX = length(uniqueX);
numOfElY = length(uniqueY);
marginX = zeros(numOfElX);
marginY = zeros(numOfElY);
jointMat = zeros(numOfElY, numOfElX);
% scanning the image looking for the values
%for ii=1:numOfElY
    for jj=1:numOfElX
        % now I scan the image looking for the valuesf
        for rr=1:rowX
            for cc=1:colX
                if matW(rr,cc)== uniqueX(jj)
                    val = matE(rr,cc);
                    ee=1;
                    while (ee <= length(uniqueY))
                        if uniqueY(ee) == val 
                            jointMat(ee,jj) =  jointMat(ee,jj) +1;
                            ee=length(uniqueY)+1;
                        end;
                        ee = ee+1;
                    end; % end while
                end; % end if
            end;
        end;
    end;
%end;
totalEl = sum(jointMat(:));
jointMat = jointMat / totalEl;

% calculating marginY
for ii=1:numOfElX
  marginX(ii)= sum(jointMat(:,ii));   
end;

for ii=1:numOfElY
  marginY(ii)= sum(jointMat(ii,:));   
end;
% calculating marginX





end