%% ECES t580 Lab 2
% Bhautik (Brian) Amin


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
tt = linspace(0,1000); % From 0 to 1000 seconds
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
title('FFT of signal, 64 points')

%%
% From the magnitude plot, we can see that the x axis does not truly
% represent the information presented from the output of our FFT function

%%
% 4. Fix x-axis and plot again
dF = Fs/64; % Setup x axis steps (0 to 63)
freq = -Fs/2:dF:Fs/2-dF;
figure(3);
plot(freq, abs(fft_out)/64) % Plot fft of the signal
title('FFT of Signal, 64 Points')
xlabel('Frequency (Hz')
ylabel('Magnitude')

%%
% 5. According to the graph, it can be seen that 40Hz is the frequency of the
% signal. This is not correct however, as the FFT must be shifted 

%%
% 6. Shift FFT signal and plot again 
fft_out = fftshift(fft(x(1:64)));
dF = Fs/64; % Setup x axis steps (0 to 63)
freq = -Fs/2:dF:Fs/2-dF;
figure(4);
plot(freq, abs(fft_out)) % Plot fft of the signal
title('FFT of Signal, 64 Points')
xlabel('Frequency (Hz')
ylabel('Magnitude')
%%
% 7. The frequency of our shifted graph is at 10 Hz, thus matching the
% signal generated earlier

%%
% 8. Try a 1024 point DFT
fft_out = fftshift(fft(x));
dF = Fs/length(fft_out); % Setup x axis steps (0 to 63)
freq = -Fs/2:dF:Fs/2-dF;
figure(5);
plot(freq, abs(fft_out)) % Plot fft of the signal
title('FFT of Signal, 1024 Points')
xlabel('Frequency (Hz')
ylabel('Magnitude')

%% Lab 2.2.1

%%
% 1. How many CDS regions are there in this sequence? (A CDS sequence is a
% coding sequence that results in a protein product
hbb = genbankread('hbb_region_chr11.gb'); % Load file as struct
CDS = hbb.CDS;
amount_regions = length(CDS)

%%
% There are 5 regions in the sequence. hbb.CDS(5) correlates to the HBB
% gene:
hbb.CDS(5).gene

%%
% 2. Look at hbb.CDS(1), what is the length of this region? How would you identify the coding and
% non-coding sequences for this hbb.CDS(1) region on Chromosome 11?

%%
% We can look at the locations, and draw a conclusion for the length of the
% region
CDS(1).location

%%
% We can see these same values under the .indices field as well:
r1 = CDS(1).indices

%%
% Now to compute the total length of region:
len = (r1(6) - r1(1))

%%
% The total length of the region is 1421. We can tell the coding and
% noncoding regions by taking a look at the .location field again:
CDS(1).location

%%
% Between 27726 to 27817 is a coding region, and between 27817 to 27940 is
% a noncoding region. Essentially, the indices give the range for the
% coding sequences, and between these ranges are noncoding areas

%%
% 3. Write a function that will take a sequence and CDS indices as input and outputs the corresponding
% coding and non-coding DNA sequences.
% Hint:
% The instructor will verify that it is correct by entering a random CDS region’s indices into your
% function

%%
% My function is called dissectCDS, and its located in dissectCDS.m
% Here is an example of usage:
[coding, noncoding] = dissectCDS(hbb.Sequence, CDS(1).indices);

%% Lab 2.2.3

% Convert coding sequence obtained above (For CDS(1), the HBE1 gene in this case)
% to binary representation
coding_A = (upper(coding)=='A'); % find A bases and set them to 1
coding_T = (upper(coding)=='T'); % find T bases and set them to 1
coding_G = (upper(coding)=='G'); % find G bases and set them to 1
coding_C = (upper(coding)=='C'); % find C bases and set them to 1
coding_FT = abs(fft(coding_A,1024)).^2+abs(fft(coding_T,1024)).^2+abs(fft(coding_G,1024)).^2+abs(fft(coding_C,1024)).^2; % FFT of the sequence


%%
% Now plot the signal, plot without x-axis labels
figure(6)
plot(coding_FT)
title('FFT of coding sequence')
%%
% We can trim this plot to zoom in on the sequence
figure(6)
plot(coding_FT(100:800))
title('Trimmed FFT of coding sequence plot')

%%
% We can see two peaks now clearly

%%
% Compute noncoding sequence fft
% Convert noncoding sequence obtained above (For CDS(1), the HBE1 gene in this case)
% to binary representation
noncoding_A = (upper(noncoding)=='A'); % find A bases and set them to 1
noncoding_T = (upper(noncoding)=='T'); % find T bases and set them to 1
noncoding_G = (upper(noncoding)=='G'); % find G bases and set them to 1
noncoding_C = (upper(noncoding)=='C'); % find C bases and set them to 1
noncoding_FT = abs(fft(noncoding_A,1024)).^2+abs(fft(noncoding_T,1024)).^2+abs(fft(noncoding_G,1024)).^2+abs(fft(noncoding_C,1024)).^2; % FFT of the sequence

%% 
% Now plot signal without x-axis labels
figure(7)
plot(noncoding_FT)
title('FFT of noncoding sequence')

%%
% We can trim this plot in a similar fashion
figure(7)
plot(noncoding_FT(100:900))
title('Trimmed FFT of noncoding sequence')

%% Lab 2.3.1

% My function is called threebasefreq_stft, and its located in threebasefreq_stft.m
% Here is an example of usage:
threebase = threebasefreq_stft(hbb.Sequence,100, 1024);
figure(8)
plot(threebase)
threebase = threebasefreq_stft(hbb.Sequence, 1000, 1024);
figure(9)
plot(threebase)


%% Function Appendix
% Functions were created and called as separate files. Here are the posted
% functions for review
function [coding, noncoding] = dissectCDS(sequence, CDS_indices)
% dissectCDS  Give a sequence and the desired CDS region's indices.
%             Program will return the coding sequence and noncoding
%             sequence as two arrays
%   [coding, noncoding = dissectCDS(hbb.Sequence, CDS(1).indices)
%   [coding, noncoding] = dissectCDS(Sequence, CDS_indices)

coding = []; % Create empty arrays to store the coding and noncoding sequences
noncoding = [];

% Find coding regions and store them
for i=1:2:length(CDS_indices)-1
    coding = [coding, sequence(CDS_indices(i):CDS_indices(i+1))];
end
% Find noncoding regions and store them
for i=2:2:length(CDS_indices)-1
   noncoding = [noncoding, sequence(CDS_indices(i):CDS_indices(i+1))]; 
end
end

function threebase = threebasefreq_stft (DNA_SEQUENCE, WINDOW_LENGTH, NFFT)
% threebasefreq_stft  Give a sequence and the desired window size as well as NFFT.
%                     Program will return the short time FFT
%                     threebase = dissectCDS(hbb.Sequence, 100, 1024)
sequence_length = length(DNA_SEQUENCE);
a = 1;
threebase = 0;
b = WINDOW_LENGTH;
% Convert sequence to binary
for i = 0:sequence_length-WINDOW_LENGTH-1
    A = (upper(DNA_SEQUENCE(a:b))=='A'); % find A bases and set them to 1
    T = (upper(DNA_SEQUENCE(a:b))=='T'); % find T bases and set them to 1
    G = (upper(DNA_SEQUENCE(a:b))=='G'); % find G bases and set them to 1
    C = (upper(DNA_SEQUENCE(a:b))=='C'); % find C bases and set them to 1
    % FFT of the window
    threebase = threebase +  abs(fft(A,NFFT)).^2+abs(fft(T,NFFT)).^2+abs(fft(G,NFFT)).^2+abs(fft(C,NFFT)).^2;
    threebase = threebase/3;
    a = a + 1;
    b = b + 1;
end
end



