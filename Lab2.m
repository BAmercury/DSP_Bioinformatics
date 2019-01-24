%% Lab 2.1.1

%%
% 1. How many hits did 'hbb' get?
% My url was: https://www.ncbi.nlm.nih.gov/gene/?term=hbb
% My query came with a total of 1561 results

%%
% 2. Click nucleotide link. To the right (in Top Organisms box):
% My suggestions were:
% Homo sapiens (89)
% Mus musculus (36)
% Bos taurus (19)
% Rattus norvegicus (10)
% Pan troglodytes (7)
% All other taxa (1400)

%%
% 3. hbb AND human[orgn]. The amount of hits: 89

%%
% 4. Explore the HBB hemoglobin  subunit beta record
% http://www.ncbi.nlm.nih.gov/gene/3043

%%
% 5. hbb, human, and RefSeqGene query
% https://www.ncbi.nlm.nih.gov/nuccore/28380636

%% 
% 6. We aim to obtain whole region and do analysis of 81,706 bp of linear DNA

%% Lab 2.1.2

%%
% 1. Generate one second of a cosine with
ws = 10; % Hz
Fs = 100; % Hz
% Assign signal to x and have tt as time axis
t = 0:1/Fs:1;
x = cos(2*pi*ws*t); % Create a cosine wave with frequency 10Hz, sampled at 100 Hz
tt = linspace(0,1000) % From 0 to 1000 seconds
figure(1);
plot(t,x) % Plot the cosine wave
title({'Cosine', 'Frequency: 10 Hz', 'Sampling Frequency: 100 Hz'})
xlabel('Time (seconds)')
ylabel('Amplitude')
%%
% 2. Take FFT, 64 points (1-65)
fft_out = fft(x(1:64)); % Take fft of signal and then shift zero-frequency to center of spectrum


%%
% 3. Plot magnitude of 64-point FFT at range of 0 to 63
figure(2);
plot((0:63), abs(fft_out)/length(fft_out))

%%
% From the magnitude plot, we can see that the x axis does
% not reflect the signal itself well. The two large peaks should
% represent the 10 Hz frequency of the signal, and ideally
% this fft should be centered at 0

%%
dF = Fs/64; % Setup x axis steps (0 to 63)
freq = -Fs/2:dF:Fs/2-dF;
figure(2);
plot(freq, abs(fft_out)/64) % Plot fft of the signal

%%
% From the plot, we can see that the frequency
fft_out = fftshift(fft(x(1:64)));