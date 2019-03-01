%% ECES T580 HW 2
% Bhautik Amin


%% 1. Introduction to Phylogeny
% Bootstraping given data with 5 replicates
% and computing the confidence of each branch

clc;clear;
%%
% Data:
X = 'TACCCGAT';
Y = 'TAAACGAT';
Z = 'AAAACGCG';
W = 'AAAACGAT';
seq = {X,Y,Z,W};
headers = {'X','Y', 'Z', 'W'};
num_seq = 4;
% Compute pairwise distance between all 4 sequences
seq_dist = seqpdist(seq);
% Construct the first tree, using UPGMA
seq_tree = seqlinkage(seq_dist, 'average', headers);
% View the tree
phytreeviewer(seq_tree);

%%
% Making 5 bootstraps now
num_desired = 5;
str_len = 8; % Number of chars in the string

remixes = cell(num_desired, 1);
temp.Header = 0;
temp.Sequence = 0;
for i=1:num_desired
    % Randsample used to pick random number from
    % 1 to str_len
    random_seed = randsample(str_len, str_len, true);
    % Use this value as a seed to reorder the sequence
    for j=num_seq:-1:1 % Run in reverse
        temp(j).Header = headers(j);
        st = seq{j};
        temp(j).Sequence =  strrep(st(random_seed),'-',''); 
    end
    remixes{i} = temp;
end

%%
% Compute new trees from bootstraping and view them
new_trees = [];
phytreeviewer(seq_tree);
for i=1:num_desired
    % Compute the tree from the remix data
    data = remixes{i};
    cell_data = {data(1:end).Sequence};
    dist = seqpdist(cell_data);
    sub_tree = seqlinkage(dist, 'average', headers);
    phytreeviewer(sub_tree);
    
end
