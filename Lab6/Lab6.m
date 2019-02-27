

%% Lab 6.1.1

%% 
%Import data and clean

[headers, seq] = fastaread('data.fasta');


%%
% Find Rseq, plot it vs l (assuming e(n) = 0).
% Also make a bxl table of the base information:
% h per l position, Remember h=p(b,l)*Rseq(l)

% H(l) = -p(A, l)*log(P(A, l))-p(T, l)*log(P(T, l))-p(G, l)*log(P(G, l))-p(C, l)*log(P(C, l))



H = [];
R = [];
% find how many positions are in the sequence
temp = seq(1);
positions = length(temp{1});
no_of_sequences = length(seq);
p_a = 0; p_t =0; p_g=0; p_c=0;

% Make a bxl table
height_table = eye(4,20)
% Order is A, T, G, C
for i=1:positions
    for j=1:no_of_sequences
        temp = seq(j); % So for sequence at count j
        seq_at_pos = upper(temp{1}(i)); % Pull out the ith index, make sure upper case and consistent
        switch seq_at_pos % Run through switch statement and increment found value
            case 'A'
                p_a = p_a + 1;
            case 'G'
                p_g = p_g + 1;
            case 'T'
                p_t = p_t + 1;
            case 'C'
                p_c = p_c + 1;
        end

    end
    p_a = p_a/positions;
    p_g = p_g/positions;
    p_c = p_c/positions;
    p_t = p_t/positions;
    % We'll need to calculate H(i)
    H_pos = -p_a*log2(p_a) - p_t*log2(p_t) - p_g*log2(p_g) - p_c*log2(p_c);
    H = [H, H_pos];
    R = [R, 2-H_pos];
end

% Plot
plot(1:positions, R)
[W, handle] = seqlogo(seq,'DisplayLogo', true)



