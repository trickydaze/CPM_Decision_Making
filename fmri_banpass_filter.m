function [fmat]=fmri_banpass_filter(mat,sf,cH,cL);
% Band-pass filter
% [fmat]=fmri_banpass_filter(mat,sf,cH,cL);
% mat   : data [data point, regions]
% sf    : sampling frequency [Hz]
% cH    : high cut-off frequency [Hz]
% cL    : low cut-off frequency [Hz]

%dim=size(mat);

% change the cut-off frequency into normalized frequency
% cH, cL should be the value within [0,1].
% 1 is corresponding to the (sampling time)/2 
cL2 = cL/(sf/2);
cH2 = cH/(sf/2);

% parameter setting
N=2;            % order of butterworth filter 1*n
Wn=[cL2,cH2];   % cut-off frequency

% construct a butter worth filter
[B,A] = butter(N,Wn);

% figure; freqz(B,A);   % plot frequency response
fmat=filtfilt(B,A,double(mat));  % filter for both direction


