function xx = key2note(X,keynum,dur)%KEY2NOTE Synthesize sinusoids from key number and duration.%   x = KEY2NOTE(keynum,dur,fs) creates the sinusoid for a%   particular key number and duration (in seconds).  fs is the%   base sampling frequency of the output device.% Original code by James H. McClellan%    Rev. Dr. Bai, 01/10/2013fs = 11025;                         %-- or use 8000 Hztt = 0 : 1/fs : dur-1/fs;if keynum==0                        % Silence    xx = zeros(size(tt));else    freq = 440*(2^((keynum-49)/12));%     %% Without Harmonics%      xx = real( X*exp(1i*2*pi*freq*tt) );    %% With Harmonics    f = freq*[1 2 4];               % Add harmonic components    A = [1  1/2  1/4]*X;            % Amplitudes for harmonic frequencies        %Allocationg space new wave    xx=zeros(1,length(tt));    %looping through all frequencies to add the harmonics    for i=1:length(f)        %add all frequencies on top of each other        xx = xx+ real(A(i) * cos(2*pi*f(i) * tt));    end%    ---  Add ADSR  ---%    ee = adsr(dur,tt);    xx = xx.*ee;end%     if voice == 1,    %         f = f0*[1 2 3 4]';    %         A = [1  1/2  1/4 1/8];    %     elseif voice == 2    %         f = f0*[1 3 5]';    %         A = 0.8*[1  1/2  1/4];    %     elseif voice == 3,    %         f = 1.5*f0*[1 2 3 4]';    %         A = [1  1/2  1/4 1/8];    %     end    %     %    f = f0;    %     %    A = 1;        %     %  xx = xx .^ 5;    %     %   xx = sqrt(abs(xx)) .* sign(xx);        %   xx = sqrt(abs(xx)) .* sign(xx);    %   xx = xx .^ 5;    