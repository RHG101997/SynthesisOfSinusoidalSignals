%--- play_scale.m 
scale.keys = [ 40 42 44 45 47 49 51 52 ];
%--- NOTES: C D E F G A B C key #40 is middle-C
scale.durations = 1 * ones(1,length(scale.keys));
fs = 11025; 
xx = zeros(1, sum(scale.durations)*fs+length(scale.keys) );%creating scale vector
n1 = 1;
X=1*exp(1i*0);%amplitude complex
for kk = 1:length(scale.keys)
    keynum = scale.keys(kk);% key number
    tone = key2note(keynum,fs,scale.durations(kk),1); %<=== FILL IN THIS LINE
    n2 = n1 + length(tone) - 1;%indexing for xx vector
    xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
    n1 = n2 + 1;
end
soundsc( xx, fs )% playing sound

%see the plot
specgram(xx,512,fs);
% plotspec(xx,fs);