%% ECES T580 Homework 1
% Bhautik (Brian) Amin

%% Q1

%% Part A
% Find a protein sequence of hypothetical AF1226 (Positions 141-147)
% Sequence of amino acids in single letter representation


%%
% Check if file already exists, if it doesn't. Download file from genbank
if exist('O29042.txt') == 2
    % Bring file into matlab
    seq = genpeptread('O29042.txt');
else
    % Grab file and then bring it into matlab, query for sequence positoins
    % 141-147
    getgenpept('O29042','PartialSeq', [141 147], 'toFile', 'O29042.txt');
    seq = genpeptread('O29042.txt');
end

%%
% Sequence given in single letter representation:
seq.Sequence

%% Part B
% How many nucleotide sequences can give rise to an arbitrary amino acid sequence (hint:
% revgeneticcode)? Write a function that returns the possible sequences. The input to
% the function should be a string (amino acid sequence) and the output should be the
% potential nucleotide sequences.

%%
% The function I wrote is called find_nt_seq located in find_nt_seq.m
possible_nt_sequences = find_nt_seq(upper(seq.Sequence));
%%
% This function returns a cell array consistint of subarrays that contain
% the various NT codons that represent the given amino acid characters in
% the sequence string
%%
% Typical indexing usage: Our given amino acid string is 'harvad'

%%
% 'h':
possible_nt_sequences{1}(2:end)

%%
% Or to display the included header:
possible_nt_sequences{1}(1:end)

%% Part C
% Using the Matlab function from part b), calculate the number of sequences that could
% give rise to the 7 amino acid sequence found in part a).

%%
% For our 7 character amino acid sequence, based on the data presented in
% the cell array, there are 28 condons in total

%% Part D
% Create a Matlab function nt2aa cgbiased.m that will take an amino acid sequence as
% the input and will choose the corresponding codons with the highest CG content. Note:
% If there is more than one sequence that satisfies this condition, pick one at random.
% What is the nucleotide sequence that could give rise to the 7 amino acid sequence
% found in part a).

%%
% The function I wrote is called aa2nt_cgbiased locate din aa2nt_cgbiased.m
possible_nt_sequences_cg_biased = aa2nt_cgbiased(upper(seq.Sequence));

% Based off the orignial find_nt_seq this version adds in a simple
% search/filter that will only append/return codons with highest CG content
for (i=1:7)
    disp(possible_nt_sequences_cg_biased{i}(1:end))
end

%% Q2 and Q3
% Please see appended pictures at end of document

%% Q4

%% Part A
% Obtain two highly similar E. Coli bacterial genomes NC_002655 and NC_002695. Is it
% possible to take the global alignment of them?

%% 
% Because the completed genomes NC_002655 and NC_002695 were quite large,
% BLAST (blastn specfically) was run through website query using the 'Align
% two or more sequences' advanced query (BLAST 2 Sequences). Results are given as followed:

%%
% Max Score: 9.921e+05 | Total Score: 1.420e+07

%%
% To clarify the query, NC_002655 was the Query ID, and NC_002695 was the
% Subject ID (to be compared against). With these scores in mind it can be
% seen that the two sequences scored high


%% Part B
% Take two similar genes of E. Coli sequences, gene1.gb and gene2.gb. Align them as
% nucleotide sequences with global alignment (print out the score and alignment).
% Where is the region of dense dissimilarity?

%%
% Read genbank files

seq = genbankread('gene1.gb');
seq2 = genbankread('gene2.gb');

% Align them as nucleotide sequences with global alignment
% (Needleman-Wunsch Algorithm)

% This will run with a default Gap value of 8
% Data specfied as a nucleotide sequence
[NT_score, NT_alignment] = nwalign(seq.Sequence, seq2.Sequence, 'Alphabet', 'NT', 'ShowScore', true);

%% 
% Nucleotide Global Alignment Score:
NT_score

%%
% Nucleotide Global Alignment:
NT_alignment

%%
% Where is the region of dense dissimilarity?
% The generated heat map/sequence dot plot can be used to best understand
% the regions of greatest dissimilarity. In the plot, it can be seen that
% the regions of dense dissimilarity are featured in blue. The black line
% going across the plot represents the greatest area of similarity

%%
% Part C
% Now globally align the Genes as Amino Acid sequences. Do these nucleotide regions
% of dissimilarity yield a high difference in the amino acid sequence?
[AA_score, AA_alignment] = nwalign(seq.Sequence, seq2.Sequence, 'Alphabet', 'AA', 'ShowScore', true);

%% 
% Amino Acid Global Alignment Score:
AA_score

%%
% Amino Acid Global Alignment:
AA_alignment

%%
% We can see that the alignment score for the amino acid is different,
% however from the heat mat plots between both NT and AA we can see that
% the regions of disimilarity are similar between NT and AA


%% Function Appendix
% Functions were executed as .m files, but appended on here for review
function possible_cat = find_nt_seq(desired_aa_sequence)
%        Function takes in desired Amino Acid Sequence, in single letter
%        representation (Note that the characters must all be capital
%        letters! Function returns possible nucleotide codons that make up
%        this given amino acid sequence. Function returns data formatted as
%        indexible cell array. Standard usagae:
%        possible_cat = find_nt_seq('ARND');


    % Generate nt to aa map
    map = revgeneticcode(1, 'Alphabet', 'DNA');
    possible_cat = {}; % Create empty cell array to store data
    for (i=1:strlength(desired_aa_sequence)) % Iterate through each amino acid in sequence
        desired_aa = desired_aa_sequence(i);
        % This switch stastement is used to extract the possible nucleotide
        % sequences that correlate to desired amino acid character
        switch desired_aa
            case 'A'
                possible_nt_seq = map.A;
            case 'R'
                possible_nt_seq = map.R;
            case 'N'
                possible_nt_seq = map.N;
            case 'D'
                possible_nt_seq = map.D;
            case 'C'
                possible_nt_seq = map.C;
            case 'Q'
                possible_nt_seq = map.Q;
            case 'E'
                possible_nt_seq = map.E;
            case 'G'
                possible_nt_seq = map.G;
            case 'H'
                possible_nt_seq = map.H;
            case 'I'
                possible_nt_seq = map.I;
            case 'L'
                possible_nt_seq = map.L;
            case 'K'
                possible_nt_seq = map.K;
            case 'M'
                possible_nt_seq = map.M;
            case 'F'
                possible_nt_seq = map.F;
            case 'P'
                possible_nt_seq = map.P;
            case 'S'
                possible_nt_seq = map.S;
            case 'T'
                possible_nt_seq = map.T;
            case 'W'
                possible_nt_seq = map.W;
            case 'Y'
                possible_nt_seq = map.Y;
            case 'V'
                possible_nt_seq = map.V;
            case 'Starts'
                possible_nt_seq = map.Starts;
            case 'Stops'
                possible_nt_seq = map.Stops;
            otherwise
                possible_nt_seq = "Please input valid sequence";
            
        end
        % Append given NT data to cell array and iterate through the amino
        % acid sequence string again
        possible_cat{i}(:,1) = vertcat(desired_aa, possible_nt_seq');
    end
        
    

end

function possible_cat = aa2nt_cgbiased(desired_aa_sequence)
    % Generate nt to aa map
    map = revgeneticcode(1, 'Alphabet', 'DNA');
    possible_cat = {};
    for (i=1:strlength(desired_aa_sequence)) % See find_nt_seq.m for details
        desired_aa = desired_aa_sequence(i);
        switch desired_aa
            case 'A'
                possible_nt_seq = map.A;
            case 'R'
                possible_nt_seq = map.R;
            case 'N'
                possible_nt_seq = map.N;
            case 'D'
                possible_nt_seq = map.D;
            case 'C'
                possible_nt_seq = map.C;
            case 'Q'
                possible_nt_seq = map.Q;
            case 'E'
                possible_nt_seq = map.E;
            case 'G'
                possible_nt_seq = map.G;
            case 'H'
                possible_nt_seq = map.H;
            case 'I'
                possible_nt_seq = map.I;
            case 'L'
                possible_nt_seq = map.L;
            case 'K'
                possible_nt_seq = map.K;
            case 'M'
                possible_nt_seq = map.M;
            case 'F'
                possible_nt_seq = map.F;
            case 'P'
                possible_nt_seq = map.P;
            case 'S'
                possible_nt_seq = map.S;
            case 'T'
                possible_nt_seq = map.T;
            case 'W'
                possible_nt_seq = map.W;
            case 'Y'
                possible_nt_seq = map.Y;
            case 'V'
                possible_nt_seq = map.V;
            case 'Starts'
                possible_nt_seq = map.Starts;
            case 'Stops'
                possible_nt_seq = map.Stops;
            otherwise
                possible_nt_seq = "Please input valid sequence";
            
        end
        % Here is where we add heuristic to filter only codons with highest cg content
        highest_nt_cgbiased = find_cg_value(possible_nt_seq); % Wrote a helper function to count cg content
        possible_cat{i}(:,1) = vertcat(desired_aa, highest_nt_cgbiased); % Append the nt with highest cg
    end
        


end

function highest_content = find_cg_value(aa_cell)

    % Helper function that will find total number of c and g characters within some string
    cg_count = 0;
    index=0;
    for (i=1:length(aa_cell)) %Iterate through the string
        
        x = count(aa_cell(i), {'G', 'C'}); % Count G and C
        
        if (x >= cg_count) % Simple search for highest cg count
            cg_count = x;
            index = i;
        end
    end
    
    highest_content = aa_cell(index); % Return codon with highest cg


    


end