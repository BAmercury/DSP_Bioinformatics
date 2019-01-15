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
rlcodons = codoncount(s.Sequence, 'frame', 3, 'figure', true);
title('Frame 3')
%% Part 1.3.1: Find ORFs based on length

%%
% Find ORFS of length > 50 in Frame 1 of the given sequence
orf_min_50 = seqshoworfs(s.Sequence, 'Frames', 1, 'MinimumLength', 50);
% Find ORFS of length > 500 in Frame 1 of the given sequence
orf_min_500 = seqshoworfs(s.Sequence, 'Frames', 1, 'MinimumLength', 500);

%% Part 1.3.2 Finding optimum threshold for ORFs
