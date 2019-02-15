function Threebaseperiodicity_vs_position = parallel_threebasefreq_stft (DNA_SEQUENCE, WINDOW_LENGTH, NFFT, division, index)

%%
% Function Goals:
% Divide DNA into a sequence of parts. For each parallelized iteration, the
% function needs to know which part is which and figure out which
% subsequence it will need to extract (start and end indices). Make sure
% all possible window positions are covered by the subsequence


%%
% Calculate the amount of chunks desired (Depends on number of available
% workers)
chunks_size = floor(length(DNA_SEQUENCE)/division); %Floor used to round down number


%%
% Determine start point based on index
start_point = (index-1)*chunks_size+1;

%%
% If the index is the last segment of DNA, otherwise seg the end point with
% respect to the index and desired chunk size
if index == division
    end_point = length(DNA_SEQUENCE);
else
    end_point = index*chunks_size+WINDOW_LENGTH-1;
end
%%
% Extract desired DNA sequence now
seq_div = DNA_SEQUENCE(start_point:end_point);
% Run the individual segment through threebasefreq_stft and return results
Threebaseperiodicity_vs_position = threebasefreq_stft (seq_div, WINDOW_LENGTH, NFFT);


