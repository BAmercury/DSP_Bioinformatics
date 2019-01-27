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