%% Part 1.1.1 Download sequence with accession number and load into MATLAB
% Retrieve sequence, save to file
clc;close all; clear;
%%
% Check if file already exists, if it doesn't. Download file from genbank
if exist('nm_000520.txt') == 2
    % Bring file into matlab
    s = genbankread('nm_000520.txt');
else
    % Grab file and then bring it into matlab
    getgenbank('nm_000520', 'toFile', 'nm_000520.txt');
    s = genbankread('nm_000520.txt');
end
%%
% Extract sequence
seq = getgenbank('nm_000520', 'SequenceOnly', true);

%% Part 1.2.1 Getting basic statistics
% Format long sequence output
seqdisp(s.Sequence)
%%
% Count nucleotides in sequence
[seq_counts] = basecount(s.Sequence)
%%
% Plot density of nucleotides along sequence
figure(1)
seq_density_n20 = ntdensity(s.Sequence)
%%
% Count dimers in the nucleotide sequence
figure(2)
[Dimers, Percent] = dimercount(s.Sequence, 'chart', 'pie')
%%
% Count 3-mer in nucleotide sequence
trimer = nmercount(s.Sequence, 3)
%%
% Try different window sizes for ntdensity function
% Default is length(seq)/20
% Lets try doing length(seq)/10, using the round() function since the window length must
% be an integer
figure(3)
seq_density_n10 = ntdensity(s.Sequence, 'WINDOW',round(length(s.Sequence)/10))
%%
% And we can try length(seq)/30
figure(4)
seq_density_n30 = ntdensity(s.Sequence, 'WINDOW',round(length(s.Sequence)/30))
%%
% The window sizes for each of these three values are as follows:
% length(seq)/10 = ~275 || length(seq)/20 = ~137 || length(seq)/30 ~ 91
% The advance of having the larger window size is that the image is more
% more clear to see (A bit zoomed in). However larger window sizes require
% you to pan to look at specfic points of interest. Smaller window sizes
% allow for one to see large amounts of data within one space

%% Part 1.3.1: Condon Count and ORF
% Return codon counts for each of the six reading frames
% Plot the results in a heat map
figure(5)
rlcodons_1 = codoncount(s.Sequence, 'frame', 1, 'figure', true);
title('Frame 1')
figure(6)
rlcodons_2 = codoncount(s.Sequence, 'frame', 2, 'figure', true);
title('Frame 2')
figure(7)
rlcodons_3 = codoncount(s.Sequence, 'frame', 3, 'figure', true);
title('Frame 3')
%%
% To get the other 3 frames we take the reverse complement
figure(8)
rlcodons_4 = codoncount(s.Sequence, 'Reverse',true,'frame', 1, 'figure', true);
title('Frame 4')
figure(9)
rlcodons_5 = codoncount(s.Sequence, 'Reverse',true,'frame', 2, 'figure', true);
title('Frame 5')
figure(10)
rlcodons_6 = codoncount(s.Sequence, 'Reverse',true,'frame', 3, 'figure', true);
title('Frame 6')
%% Part 1.3.1: Find ORFs based on length

%%
% Find ORFS of length > 50 in Frame 1 of the given sequence
orf_min_50 = seqshoworfs(s.Sequence, 'Frames', 1, 'MinimumLength', 50);
%%
% Find ORFS of length > 500 in Frame 1 of the given sequence
orf_min_500 = seqshoworfs(s.Sequence, 'Frames', 1, 'MinimumLength', 500);

%% Part 1.3.2 Finding optimum threshold for ORFs
% we can find the optimum length of ORF
%%
% Get total number of stop codons within each frame
total1 = rlcodons_1.TGA + rlcodons_1.TAG + rlcodons_1.TAA;
total2 = rlcodons_2.TGA + rlcodons_2.TAG + rlcodons_2.TAA;  
total3 = rlcodons_3.TGA + rlcodons_3.TAG + rlcodons_3.TAA;
total4 = rlcodons_4.TGA + rlcodons_4.TAG + rlcodons_4.TAA;
total5 = rlcodons_5.TGA + rlcodons_5.TAG + rlcodons_5.TAA;
total6 = rlcodons_6.TGA + rlcodons_6.TAG + rlcodons_6.TAA;
totalStop = total1 + total2 + total3 + total4 + total5 + total6
%%
% Get total number of codons in the sequence
c1 = struct2cell(rlcodons_1);
c2 = struct2cell(rlcodons_2);
c3 = struct2cell(rlcodons_3);
c4 = struct2cell(rlcodons_4);
c5 = struct2cell(rlcodons_5);
c6 = struct2cell(rlcodons_6);
TotalCodons1 = CalculateTotal(c1, length(c1));
TotalCodons2 = CalculateTotal(c2, length(c2));
TotalCodons3 = CalculateTotal(c3, length(c3));
TotalCodons4 = CalculateTotal(c4, length(c4));
TotalCodons5 = CalculateTotal(c5, length(c5));
TotalCodons6 = CalculateTotal(c6, length(c6));
TotalCodons = TotalCodons1 + TotalCodons2 + TotalCodons3 + TotalCodons4 + TotalCodons5 + TotalCodons6

%%
% Find optimal length
k = log(0.05) / log(1 - (totalStop/TotalCodons))
%%
% Find ORFs with the given estimated numberorf_min_50 = seqshoworfs(s.Sequence, 'Frames', 1, 'MinimumLength', 50);
orf_estimated = seqshoworfs(s.Sequence, 'Frames', 1, 'MinimumLength', k);


%% General Functions
% Quick function to calculate total within frame cell array
function total = CalculateTotal(array, length)
total = 0;
for n=1:length
    total = total +  array{n};    
end
end


