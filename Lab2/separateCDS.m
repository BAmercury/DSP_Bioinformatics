function [coding, noncoding] = separateCDS(sequence, CDS_indices)

%   [coding, noncoding] = separateCDSregion(hbb.Sequence, CDS(1).indices)
%   [coding, noncoding] = separateCDSregion(Sequence, CDS_indices)

coding = []; % Create empty arrays to store the coding and noncoding sequences
noncoding = [];

% Find coding regions and store them
for i=1:2:length(CDS_indices)-1
    coding = [coding, sequence(CDS_indices(i):CDS_indices(i+1))];
end



% Find noncoding regions and store them
for i=2:2:length(CDS_indices)-1
   noncoding = [noncoding, sequence(CDS_indices(i):CDS_indices(i+1))]; 
end


%}