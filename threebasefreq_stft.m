function [threebase] = threebasefreq_stft (DNA_SEQ, WINDOW_LENGTH, NFFT)

sequence_length = length(DNA_SEQ);
threebase = [];
% Convert sequence to binary
for i = 1:sequence_length-WINDOW_LENGTH+1
    b = WINDOW_LENGTH;
    A = (upper(DNA_SEQ(i:i+b-1))=='A'); % find A bases and set them to 1
    T = (upper(DNA_SEQ(i:i+b-1))=='T'); % find T bases and set them to 1
    G = (upper(DNA_SEQ(i:i+b-1))=='G'); % find G bases and set them to 1
    C = (upper(DNA_SEQ(i:i+b-1))=='C'); % find C bases and set them to 1
    % FFT of the window
    FT = abs(fft(A,NFFT)).^2+abs(fft(T,NFFT)).^2+abs(fft(G,NFFT)).^2+abs(fft(C,NFFT)).^2;
    threebase = [threebase, FT(floor(NFFT/3))];

end