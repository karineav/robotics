function [ w ] = VoiceRecog( pause_dur )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Negative W = turn right
% AAAA = turn right
    w = 0;
    r = audiorecorder(1000, 16, 1);
    
    rows_delete = [96:1:161];
    
    record(r);     % speak into microphone...
    % pause(r);
    pause(pause_dur);
    % p = play(r);   % listen
    % resume(r);     % speak again
    stop(r);
     % listen to complete recording
    mySpeech = getaudiodata(r, 'double'); % get data as int16 array

    n = 80; %resolução de 2Hz
    a = spectrogram(mySpeech, hann(n), 3*n/4, 4*n, 1000, 'yaxis');
    % spectrogram(mySpeech, hann(n), 3*n/4, 4*n, 1000, 'yaxis');

    a(rows_delete,:) = [];
    size(a)
    [a1, a2] = max(a);
    
    if(abs(a(round(a2(3)/2),3)) > 0.7*abs(a(a2(3),3)))
        a2(3) = round(a2(3)/2);
    end
    freq = a2(3)*3.1
    if(a2(3)*3.1 > 210 && a2(3)*3.1 < 240)
        fino = 1
        w = 1;
    elseif(a2(3)*3.1 > 90 && a2(3)*3.1 < 120)
        fino = 0
        w = -1;
    else
        w = 0;
    end

    
    

end

