%%
% Check if file already exists, if it doesn't. Download file from genbank
if exist('NC_002655.txt') == 2
    % Bring file into matlab
    seq1 = genbankread('NC_002655.txt');
else
    % Grab file and then bring it into matlab
    getgenbank('NC_002655','PartialSeq',[1 5528445], 'toFile', 'NC_002655.txt');
    seq1 = genbankread('NC_002655.txt');
    fastawrite('NC_002655.fasta', 'Sequence', seq1.Sequence)
end

if exist('NC_002695.txt') == 2
    % Bring file into matlab
    seq2 = genbankread('NC_002695.txt');
else
    % Grab file and then bring it into matlab
    getgenbank('NC_002695','PartialSeq', [1 5498578], 'toFile', 'NC_002695.txt');
    seq2 = genbankread('NC 002695.txt');
    fastawrite('NC_002695.fasta', 'Sequence', seq2.Sequence)
end

[Score, Alignment, Start] = nwalign(seq1.Sequence,seq2.Sequence)

%[Data_blastn, RTOE_n] = blastncbi('MysSeq.fasta', 'blastn', 'database', 'nr')
%blast_n = getblast(Data_blastn,'ToFile','blast_n.rpt')
