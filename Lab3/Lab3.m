%% ECES T580 Lab 3
% Bhautik (Brian) Amin

%% Lab 3.3.1: Load Sequence into Matlab

dino_seq = textread('dinoDNA.txt', '%q'); % Read in the text file
% Extract sequence information
dino_seq = strcat(dino_seq{4:11});
% Write the sequence into discrete fasta file
fastawrite('dinoDNA.fasta', 'Sequence', dino_seq);
% Read in the fasta file
dino_seq = fastaread('dinoDNA.fasta');

%% Lab 3.2.1: BLAST mystery_sequence.txt online
% I ran the file through BLASTX. The query returned that the data in the file
% was for a nucleic acid, and that one of the proteins that scored highest on the alignment scores
% was the 2OG-Fe(II) oxygenase [bacterium TMED264], with a max score of 336

% Lab 3.2.2: Blast dinoDNA.txt in MATLAB
[dino_blastn, RTOE_n] = blastncbi('dino_DNA.fasta','blastn', 'database', 'nr')
blast_n = getblast(dino_blastn, 'ToFile', 'blast_n.rpt')