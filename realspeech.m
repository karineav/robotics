clear all
close all

% Negative W = turn right
% AAAA = turn right
w = 0;
r = audiorecorder(1000, 16, 1);
i=0;
while(i < 100)
    rows_delete = [300:1:401];
record(r);     % speak into microphone...
% pause(r);
pause(0.3);
% p = play(r);   % listen
% resume(r);     % speak again
stop(r);
 % listen to complete recording
mySpeech = getaudiodata(r, 'double'); % get data as int16 array

n = 80; %resolução de 2Hz
a = spectrogram(mySpeech, hann(n), 3*n/4, 4*n, 1000, 'yaxis');
% spectrogram(mySpeech, hann(n), 3*n/4, 4*n, 1000, 'yaxis');
% a(rows_delete,:) = [];
[a1, a2] = max(a);

if(abs(a(round(a2(3)/2),3)) > 0.7*abs(a(a2(3),3)))
    a2(3) = round(a2(3)/2);
end
a2(3)*3.1
if(a2(3)*3.1 > 210 && a2(3)*3.1 < 240)
    fino = 1
    w = 1;
elseif(a2(3)*3.1 > 90 && a2(3)*3.1 < 120)
    fino = 0
    w = -1;
else
    w = 0;
end

i=i+1;
end

% clear all
% close all
% 
% r = audiorecorder(1000, 16, 1);
% record(r);     % speak into microphone...
% pause(0.2);
% pause(0.2);
% pause(0.2);
% pause(0.2);
% pause(0.2);
% pause(0.2);
% stop(r);
% 
% 
% mySpeech = getaudiodata(r, 'double'); % get data as int16 array
% 
% n = 50;
% a = spectrogram(mySpeech, hann(n), 3*n/4, 4*n, 1000, 'yaxis')
% 
% [a1, a2] = max(a);


% -40 dB = 0.01
% -20 dB = 0.1
% -60 dB = 0.001

% AAAAAAAAAAAAAAAA - 100 Hz ~ 110 Hz (have to sound very manly)
% UUUUUUUUUUUUUUUU - 150 Hz ~ 170 Hz (have to sound very girly)
% EEEEEEEEEEEEEEEE - 115 Hz
% IIIIIIIIIIIIIIII - 135 Hz ~ 190 Hz
% OOOOOOOOOOOOOOOO - 115 Hz