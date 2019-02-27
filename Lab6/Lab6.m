

%% Lab 6.1.1

%% 
%Import data
[headers, seq] = fastaread('data.fasta');
%%
% Calculate Entropy and then Rseq. Calculate height for b x l table and
% then plot Rseq vs position (Assume e(n) = 0)

H = [];
R = [];
% find how many positions are in the sequence
temp = seq(1);
positions = length(temp{1}); % This assumes all sequences given are the same length
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
    height_table(1,i) = p_a*(2-H_pos); % A
    height_table(2,i) = p_c*(2-H_pos); % C
    height_table(3,i) = p_g*(2-H_pos); % G
    height_table(4,i) = p_t*(2-H_pos); % T
    
end

% Plot
plot(1:positions, R)
[W, handle] = seqlogo(seq,'DisplayLogo', true)



