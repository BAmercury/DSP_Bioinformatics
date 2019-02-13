

%% Lab 3.1.1

%% Without Parallel Programming
% Running previous function and getting time stamp

hbb = genbankread('hbb_region_chr11.gb'); % Load data
disp('Non-Parallelized method:')
Threebaseperiodicity_vs_position_old=threebasefreq_stft(hbb.Sequence,1000,1024);
figure(1)
plot(Threebaseperiodicity_vs_position_old)

%% With Parallel Programming
% Using a modified version of the function
disp('Non-Parallelized method:')
Threebaseperiodicity_vs_position_new=parallel_threebasefreq_stft(hbb.Sequence,1000,1024);
delete(gcp('nocreate')) % End parllel session
figure(2)
plot(Threebaseperiodicity_vs_position_new)