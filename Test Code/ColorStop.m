brick.MoveMotor('A', 100); 

while true

X = brick.ColorColor(1);
disp(X);


if X == 5
    brick.StopAllMotors('Brake');
    break;
end

end

pause(10);

brick.MoveMotorAngleRel('A', 100, 500, 'Coast');