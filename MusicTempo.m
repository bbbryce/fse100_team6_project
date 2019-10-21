
disp('Push Button To Start Tone');
while true
   if brick.TouchPressed(1) == 1
      tic;
      while brick.TouchPressed(1) == 1
          disp('Release to set tone');
      end
      t = toc * 500;
      disp(t);
      brick.playTone(100,t,t)
      pause(0.5);
      brick.playTone(100,t*20,t)
      pause(0.5);
      brick.playTone(100,t*2,t)
      pause(0.5);
      brick.playTone(100,t+10,t)
      pause(0.5);
   
   
   
   end
   
end


%  brick.playTone(100, 300, 500);
%       disp('Release Button to Stop Tone');