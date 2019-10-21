brick = ConnectBrick('Error404');

%% Example 1: Play Tone and Get Battery Level
% Play tone with frequency 800Hz and duration of 500ms.
brick.playTone(100, 800, 500);
% Get current battery level.
v = brick.GetBattVoltage()
