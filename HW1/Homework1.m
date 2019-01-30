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



%% Part 4

%a. Obtain two highly similar E. Coli bacterial genomes NC 002655 and NC 002695. Is it
%possible to take the global alignment of them with Matlab (show code and results)?
%BLAST them and show results.
%%
% Check if file already exists, if it doesn't. Download file from genbank
if exist('NC_002655.txt') == 2
    % Bring file into matlab
    seq1 = genbankread('NC_002655.txt');
else
    % Grab file and then bring it into matlab
    getgenbank('NC_002655', 'toFile', 'NC_002655.txt');
    seq1 = genbankread('NC_002655.txt');
    fastawrite('NC_002655.fasta', 'Sequence', seq1)
end

if exist('NC_002695.txt') == 2
    % Bring file into matlab
    seq2 = genbankread('NC_002695.txt');
else
    % Grab file and then bring it into matlab
    getgenbank('NC_002695', 'toFile', 'NC_002695.txt');
    seq2 = genbankread('NC 002695.txt');
    fastawrite('NC_002695.fasta', 'Sequence', seq2)
end

[Score, Alignment, Start] = nwalign(seq1,seq2)

%[Data_blastn, RTOE_n] = blastncbi('MysSeq.fasta', 'blastn', 'database', 'nr')
%blast_n = getblast(Data_blastn,'ToFile','blast_n.rpt')



