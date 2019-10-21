brick.MoveMotor('A', 100);
brick.MoveMotor('B',-100);
pause(5); % pause the script for 5 second
brick.StopMotor('A')
brick.StopMotor('B')
pause(1); % pause the script for 5 second
brick.MoveMotor('A', 50);
pause(3);
brick.MoveMotor('B',50);
pause(5);
brick.StopMotor('A')
brick.StopMotor('B')