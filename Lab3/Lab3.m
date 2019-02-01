%% ECES T580 Lab 3
% Bhautik (Brian) Amin

%% Example 3.3.1
% To be used later in the lab
% read in txt file
Mys_Seq_File = textread('mystery_sequence.txt', '%q');
% extract sequence information
Mys_Seq = strcat(Mys_Seq_File{4:11});
% write the sequence into a fasta file
%fastawrite('MysSeq.fasta', 'Sequence', Mys_Seq);

%% Lab 3.3.1: Load Sequence into Matlab

dino_seq = textread('dinoDNA.txt', '%q'); % Read in the text file
% Extract sequence information
dino_seq = strcat(dino_seq{4:11});
% Write the sequence into discrete fasta file
%fastawrite('dinoDNA.fasta', 'Sequence', dino_seq);
% Read in the fasta file
%dino_seq = fastaread('dinoDNA.fasta');

%% Lab 3.2.1: BLAST mystery_sequence.txt online
% I ran the file through BLASTN. The query returned with the top hit being:
% Francisella tularensis subsp. novicida strain AL97-2214, complete genome


%% Lab 3.2.2: Blast dinoDNA.txt in MATLAB
% ***Note: I had to comment out the blastncbi functions in order to publish
% the pdf because of the long wait times. Results are discussed as
% comments***
%[dino_blastn, RTOE_n] = blastncbi('dinoDNA.fasta','blastn')
%blast_n = getblast(dino_blastn, 'ToFile', 'blast_n.rpt')

%% Lab 3.2.3 Run Ex 3.2.2
% Perform a tblastx and retrieve the report
%[Data_tblastx, RTOE_tx] = blastncbi('MysSeq.fasta', 'tblastx', 'database', 'nr')
%tblastx = getblast(Data_tblastx,'ToFile','tblastx.rpt');
% Perform a tblastx for the first 40 base pairs
%Seq_40 = Mys_Seq(1:40);
%fastawrite('Seq_40.fasta', 'Sequence', Seq_40);
%Seq_40 = fastaread('Seq_40.fasta');
%[Data_tblastx_40, RTOE_40] = blastncbi('Seq_40.fasta', 'tblastx', 'database', 'nr');
% Perform a tblastx for the first 300 base pairs
%Seq_300 = Mys_Seq(1:300);
%fastawrite('Seq_300.fasta', 'Sequence', Seq_300);
%Seq_300 = fastaread('Seq_300.fasta');
%[Data_tblastx_300, RTOE_300] = blastncbi('Seq_300.fasta', 'tblastx', 'database', 'nr');
%%
% 1. What is the difference between blastn and tblastx
% blastn is a nucleotide to nucleotide function that finds regions of similarity between
% nucleotide sequences
% Whereas, the tblastx is looking for regions of similarity between
% translated nucleotides and translated nucleotides. It'll use one 
% translated nucleotide as a query and it'll search against a       
% database of translated nucleotides
%%
% 2. Why were shorter lengths chosen?
% BLAST is optimal when ran with sequences broken down into smaller % segments
%%
% 3. For the full length BLAST, what organisms were closley related? 
% What taxa do these belong to?
% Niveispirillum cyanobacteriorum strain TH16 chromosome eg_1, complete
% sequence was the entry that first came up. The genus of this organism is
% Niveispirillum and family would be Rhodospirillaceae

%%
% 4. Did this sequence share homology (similarity) with any known 
% and functionally annotated genes?
% This sequence shared similarity with Niveispirillum cyanobacteriorum
% within two  regions: 3142583 to 3143083 and 3142824 to 3143039
%%
% 5. What was the difference between the tblastx searches performed % by the full-length sequence vs.
% 300 bp sequence vs. 40 bp sequence?
% Both results returned with different matches. For 300 bp: 
% Indioceanicola profundi strain SCSIO 08040 chromosome, complete genome

%% Lab 3.2.3
%%
%1. What are the top hits of this BLAST search? Here are the top two hits:
% a. Gallus gallus GATA binding protein 1 (globin transcription factor 1) (GATA1), mRNA
% b. X.laevis GATA-binding protein (XGATA-2) gene, complete cds


%%
% 2. What organism do you think Mark used for his dinoDNA sequence.
% So result a, 'Gallus Gallus' is some breed of chicken. It is known that
% birds are recent relatives to the dinosuars. The second result is a breed
% of frogs, which was noted was mixed in the extracted dinosaur DNA in the
% book/movie. I believe the frog was the orgnaism used for the dinoDNA
% sequence, and I also belive that the gallus gallus has some relation to
% this dinosaur dna.

%%
% Now let’s look for Mark’s hidden message. To do this we need to start a new translated blastx search
% (blastx). This time use the SwissProt protein database (Matlab parameter: ’database’, ’swissprot’).
%%
% 3. Are the top hits for the blastx search the same as the ones you saw for blastn? Why might this be
% the case?
% The top hit was gallus gallus agian, and the second hit was a zebra fish.
% The third hit was the breed of frog mentioned before. The dinoDNA must
% contain similar amino acid sequences from these three animals. Zebrafish
% are common testing animals in many biotechnology and genetic engineering
% labs so I can imagine that its dna is mixed up in here as well.
%%
% 4. What is the hidden message that Mark put in the sequence? 
% His name

%% Lab 3.3.1

%%
% 1. Retrieve Peptide Sequences from NCBI (human: AAD01939; fly: AAQ67266).
gene1 = getgenpept('AAD01939');
gene2 = getgenpept('AAQ67266');

%%
%2. Show the Sequence Dot Plot of these two sequences.
seqdotplot(gene1, gene2)
axis square
title('AA Sequence dot plot')

%%
%3. Implement global alignment (Needleman-Wunsch Algorithm) to align these two sequences and
%show the Scoring space and wining path.
[score, alignment] = nwalign(gene1, gene2, 'Alphabet', 'AA', 'showscore', true)


