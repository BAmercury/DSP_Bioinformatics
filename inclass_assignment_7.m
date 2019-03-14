% Inclass Assignment 7 ECES T580
% Bhautik (Brian) Amin
% Based off provided psuedocode

A = [0.5, 0.1, 0.4; 0.2, 0.7, 0.1; 0.5, 0.3, 0.2]
B = [0.5, 0.3, 0.2; 0.3, 0.2, 0.5; 0.1, 0.6, 0.3]
I = [1/3, 1/3, 1/3]
seq = [1,3,2,3,1]

%% 
% Compute via MATLAB to see what the answer should be:
hidden_states = hmmviterbi(seq, A, B)
%%
% Now check with my constructed algorithm
output = viterbi(A, B, I, seq)
%%
function hidden_states = viterbi(A, B, I, O)

% Initialize Viterbi table (V) (Size of Hidden Alphabet) x (length of
% sequence + 1)
hidden_alphabet = length(A(:,1));
V = zeros( hidden_alphabet, length(O));
% So the rows are the states and the columns are the observation index

% Initialize pointer array for traceback
pointer = zeros( hidden_alphabet, length(O));
% Initialize the recursive algorithm
% For each state in hidden alphabet
for state=1:hidden_alphabet
    % Emission for the given state, first observation
    V(state, 1) = I(state) * B(state, O(1));
    pointer(state, 1) = 1;
    
end
% Now that index 1 is initialized, we can move onto rest of the sequence
for i=2:length(O)
        
    for state=1:hidden_alphabet
        [Max, ArgMax] = max(V(:, i-1).*A(:,state).*B(state,O(i)))
        V(state, i) = Max;
        %V(state, i) = B(state, O(i)) * Max;
        pointer(state, i) = ArgMax;

    end

end
% Get highest probabilities
h_star = [];
[Max, ArgMax] = max(V(:,:));
% h_star = max(V(:,length(O)));
h_star = ArgMax;


% Traceback
hidden_states = [];
for n=length(O):-1:1
        prev_h_star = pointer(h_star(n), n);
        hidden_state(n) = prev_h_star;
end
disp(hidden_states)

end

% OUTPUT:
%   2     2     2     2     2     2     2




