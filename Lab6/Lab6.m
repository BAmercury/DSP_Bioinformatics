

%% Lab 6.1.1

%% 
%Import data and clean

[headers, seq] = fastaread('data.fasta');


%%
% Find Rseq, plot it vs l (assuming e(n) = 0).
% Also make a bxl table of the base information:
% h per l position, Remember h=p(b,l)*Rseq(l)

% H(l) = -p(A, l)*log(P(A, l))-p(T, l)*log(P(T, l))-p(G, l)*log(P(G, l))-p(C, l)*log(P(C, l))



H = 0;
% find how many positions are in the sequence
temp = seq(1);
positions = length(temp{1});


for i=1:positions
    % evaluate each sequence position by position and calculate the H
    % Get probability of each base from the list of sequences
    p_a = 0;
    p_t = 0;
    p_g = 0;
    p_c = 0;
    for j=1:length(seq)
        temp = seq(j);
        temp = temp{1};
        char_ind = temp(i); % Extract the character at the current position
        switch char_ind
            case 'a'
                p_a = p_a + 1;
            case 't'
                p_t = p_t + 1;
            case 'g'
                p_g = p_g + 1;
            case 'c'
                p_c = p_c + 1;
        end
    end
    

