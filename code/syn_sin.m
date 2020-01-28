%% Lab 02a syn-sin by Dr. Bai

function [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart)
%SYN_SIN Function to synthesize a sum of cosine waves
% usage:
% [xx,tt] = syn_sin(fk, Xk, fs, dur, tstart)
% fk = vector of frequencies
% (these could be negative or positive)
% Xk = vector of complex amplitudes: Amp*eˆ(j*phase)
% fs = the number of samples per second for the time axis
% dur = total time duration of the signal
% tstart = starting time (default is zero, if you make this input optional)
% xx = vector of sinusoidal values
% tt = vector of times, for the time axis
%
% Note: fk and Xk must be the same length.
% Xk(1) corresponds to frequency fk(1),
% Xk(2) corresponds to frequency fk(2), etc.

if nargin<5, tstart=0; end  %--default value is zero

if length(fk)~=length(Xk), error('The vector length of freqeuncies and complex amplitudes should be the same!'); end
if ~isscalar(fs), error('The signal sampling rate ''fs'' should be a scalar!'); end
if ~isscalar(dur), error('The time duration of the signal ''dur'' should be a scalar!'); end
if ~isscalar(tstart), error('The starting time of the signal ''tstart'' should be a scalar!'); end

tt=tstart+0:1/fs:dur;
xx=zeros(1,length(tt));
for i=1:length(fk)
    xx=xx+real(Xk(i)*exp(1i*2*pi*fk(i)*tt));
end
