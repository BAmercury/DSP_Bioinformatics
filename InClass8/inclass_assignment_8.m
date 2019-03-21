% ECES T580 In Class Assignment 
% Bhautik (Brian) Amin



% Implement the Naive Bayes Classifier
% Train the classifier with the three training DNA sequences
% Compute log-likelihood score for a query DNA sequence

%%
% Import Test Data:

t1 = fastaread('Limnohabitans.fasta');
t2 = fastaread('s_thermotolerans.fasta');
t3 = fastaread('t_vulcanus_rbcl.fasta');
% Assemble into 1 matrix
T = [t1 t2 t3];
% To index: T(i).Sequence
% Calculate the individual probablities
t1_prob = calculate_prob(T(1).Sequence);
t2_prob = calculate_prob(T(2).Sequence);
t3_prob = calculate_prob(T(3).Sequence);

training_set = [t1_prob' t2_prob' t3_prob'];

% Import the query
query = fastaread('uncultured.fasta');
array = [];
% Find log likelihood of query sequence
for i=1:length(T)
    prob = [];
    for j = i:(length(query.Sequence)-3+1)
        pop = query.Sequence(j:j+2);
        index = hash(pop);
        prob = training_set(index, i);
    end
    
    array(i) = sum(prob);
end
% OUTPUT
% Log Likelihood:
%   array = 
%           -6.2039 -5.1193 -5.227
% The order of these answers are as followed:
%           Limnohabitans, s_thermotolerans, t_vulcanus_rbcl

% Find the maximum likelihood
[max_value, arg_max] = max(array);
disp('The Most Likely is: ')
switch arg_max
    case 1
        disp('Limnohabitans')
    case 2
        disp('s_thermotolerans')
    case 3
        disp('t_vulcanus_rbcl')
end

% OUTPUT
%   The Most Likely is:
%       s_thermotolerans



    






function index = hash(key)
    % Break down the given key and calculate the equivalent decimal representation
    index = 1;
    temp = [];
    point = 2;
    % Make sure the given key is upper case
    upper(key);
    for i=1:length(key)
        % Iterate through the given 3-mer
        % Each value of the 3-mer is encoded as [0,1,2,3]
        switch key(i)
            case 'A'
                temp(index) = 0;
            case 'C'
                temp(index) = 1;
            case 'G'
                temp(index) = 2;
            case 'T'
                temp(index) = 3;
        end
        index = index + 1;
    end
    index = temp(1)*(4^point) + temp(2)*(4^(point-1)) + temp(3) + 1;
end


function freq = freq_decomposer(DNA_seq)
    WINDOW_SIZE = 3; % For 3-Mers
    % Count 3-mers in the nucleotide, returns cell array
    val = nmercount(DNA_seq, WINDOW_SIZE);
    freq = [];
    for i = 1:length(val)
        index = hash(val{i,1});
        freq(index) = val{i,2};
    end
end

function prob = calculate_prob(seq)
    freq = freq_decomposer(seq);
    prob = [];
    for i = 1:length(freq)
        prob(i) = log( (freq(i)+1) / ( (length(seq)-3+1) + 4^3 )  );
    end
    
end

