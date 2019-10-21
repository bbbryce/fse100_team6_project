disp('Push Button To Start Tone');
while true 
    if brick.TouchPressed(1) == 1
      brick.playTone(100, 300, 500);
      disp('Release Button to Stop Tone');
    end
 %brick.playTone(100, 300, 500);
 %pause(0.75)
 
end