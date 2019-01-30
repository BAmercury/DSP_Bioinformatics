%% Bhautik Amin HW1

% a. Find a protein sequence of hypothetical AF1226 (Positions 141-147)
% Sequence of amino acids in single letter representation

% Get sequence from genbank, what is the sequence
% of amino acids from 141-147

%%
% Check if file already exists, if it doesn't. Download file from genbank
if exist('AE000782.txt') == 2
    % Bring file into matlab
    seq = genbankread('AE000782.txt');
else
    % Grab file and then bring it into matlab
    getgenbank('AE000782','PartialSeq', [141 147], 'toFile', 'AE000782.txt');
    seq = genbankread('AE000782.txt');
end

%%
seqAA = nt2aa(seq.Sequence)

%%

% Using the Matlab function from part b)
% calculate the number of sequences that could
% give rise to the 7 amino acid sequence found in part a).


% will return array of possible nucleotide sequencecs
possible_nt_sequences = find_nt_seq(seqAA);

% So for our sequence with position 141-147
% to access: length of returned cell array will be size of the amino acids
% in the string. To access: a{amino_acid_index}(2:end), where a{1}(1) would
% be the header that represents the single letter representation 

