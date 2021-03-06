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
        %% Here is where we add heuristic to filter only codons with highest cg content
        highest_nt_cgbiased = find_cg_value(possible_nt_seq); % Wrote a helper function to count cg content
        possible_cat{i}(:,1) = vertcat(desired_aa, highest_nt_cgbiased); % Append the nt with highest cg
    end
        


end