%% Lab 8.1.1
% Load data and extract the fifth non-coding region and coding region
clear all; clc;
hbb = genbankread('hbb_region_chr11.gb');
[Coding, Non] = getCRNCR(hbb, 5);

%%
% Map the two sequences to real number representation
% A: 1.5, C: 0.5, G: -0.5, T: -1.5

Coding = strrep(Coding,'a',',1.5,');
Coding = strrep(Coding,'c',',0.5,');
Coding = strrep(Coding,'g',',-0.5,');
Coding = strrep(Coding,'t',',-1.5,');
%%
% Split the comma delimited string into a cell array
Coding = strsplit(Coding,',');
%%
% Remove any extra characters (Commas, quotation marks, etc.)
Coding = [Coding(1); cellfun(@str2num,Coding(2:end),'un',0).']
%%
% Remove whitespace
Coding = Coding(~cellfun(@isempty, Coding))
%%
% Convert to mat object
Coding = cell2mat(Coding)

%%
% Map the two sequences to real number representation
% A: 1.5, C: 0.5, G: -0.5, T: -1.5

Non = strrep(Non,'a',',1.5,');
Non = strrep(Non,'c',',0.5,');
Non = strrep(Non,'g',',-0.5,');
Non = strrep(Non,'t',',-1.5,');
%%
% Split the comma delimited string into a cell array
Non = strsplit(Non,',');
%%
% Remove any extra characters (Commas, quotation marks, etc.)
Non = [Non(1); cellfun(@str2num,Non(2:end),'un',0).'];
%%
% Remove whitespace
Non = Non(~cellfun(@isempty, Non));
%%
% Convert to mat object
Non = cell2mat(Non)

%% Lab 8.2.1

%%
% What is H(z) = X_hat(z)/X(z)
% H(z) describes the transfer function of the filter. Where the input
% to the filter is X(z), the supposdely noisey data and X_hat(z) is the
% filterd output

%%
% Use the matlab function lpc to estimate the AR coefficients
% of both coding and noncoding regions (use p=100)
[a_coeff_coding, g_coding] = lpc(Coding, 100);
[a_coeff_noncoding, g_noncoding] = lpc(NonCoding, 100);

%% Lab 8.3.1



