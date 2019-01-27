function [coding, noncoding] = dissectCDS(sequence, CDS_indices)
% dissectCDS  Give a sequence and the desired CDS region's indices.
%             Program will return the coding sequence and noncoding
%             sequence as two arrays
%   [coding, noncoding = dissectCDS(hbb.Sequence, CDS(1).indices)
%   [coding, noncoding] = dissectCDS(Sequence, CDS_indices)

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