x = 0;
while x < 10
  if brick.TouchPressed(1) == 1
      brick.MoveMotorAngleRel('A', 50, 180, 'Brake');
      brick.MoveMotorAngleRel('B', 50, -180, 'Brake');
      brick.WaitForMotor('A');
      brick.WaitForMotor('B');
      while brick.TouchPressed(1) == 1
          disp('Release The Button');
      end
      brick.MoveMotorAngleRel('A', 50, -180, 'Brake');
      brick.MoveMotorAngleRel('B', 50, 180, 'Brake');
      brick.WaitForMotor('A');
      brick.WaitForMotor('B');
      x = x + 1;
  end
  
    
end