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

%% Lab 3.2.2: Blast dinoDNA.txt in MATLAB
[dino_blastn, RTOE_n] = blastncbi('dino_DNA.fasta','blastn', 'database', 'nr')
blast_n = getblast(dino_blastn, 'ToFile', 'blast_n.rpt')

%% Lab 3.2.3 Run Ex 3.2.2
% Perform a tblastx and retrieve the report
[Data_tblastx, RTOE_tx] = blastncbi('MysSeq.fasta', 'blastx', 'database', 'swissprot')
tblastx = getblast(Data_tblastx,'ToFile','tblastx.rpt')
% Perform a tblastx for the first 40 base pairs
Seq_40 = Seq(1:40);
fastawrite('Seq_40.fasta', 'Sequence', Seq_40);
Seq_40 = fastaread('Seq_40.fasta');
[Data_tblastx_40, RTOE_40] = blastncbi('Seq_40.fasta', 'tblastx', 'database', 'nr')
% Perform a tblastx for the first 300 base pairs
Seq_300 = Seq(1:300);
fastawrite('Seq_300.fasta', 'Sequence', Seq_300);
Seq_300 = fastaread('Seq_300.fasta');
[Data_tblastx_300, RTOE_300] = blastncbi('Seq_300.fasta', 'tblastx', 'database', 'nr')
%%
% 1. What is the difference between blastn and tblastx
% blastn is a nucleotide to nucleotide function that finds regions of similarity between
% nucleotide sequences
% Whereas, the tblastx is looking for regions of similarity between
% translated nucleotides and translated nucleotides. It'll use one 
% translated nucleotide as a query and it'll search against a       % database of translated nucleotides
%%
% 2. Why were shorter lengths chosen?
% BLAST is optimal when ran with sequences broken down into smaller % segments
%%
% 3. For the full length BLAST, what organisms were closley related? % What taxa do these belong to?
%%
% 4. Did this sequence share homology (similarity) with any known 
% and functionally annotated genes?
%%
% 5. What was the difference between the tblastx searches performed % by the full-length sequence vs.
% 300 bp sequence vs. 40 bp sequence?





