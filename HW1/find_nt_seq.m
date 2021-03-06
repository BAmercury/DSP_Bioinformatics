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