brick = SimBrick;
while true
    distance = brick.UltrasonicDist(4);
    pause(.1);
    if distance > 60
        %turnRightandMoveForward();
        disp("Turned Right and Moved Forward");
        brick.MoveMotorAngleRel('A',50,240.75);
        brick.MoveMotorAngleRel('B',50,-240.75);
        brick.WaitForMotor('AB');
        brick.MoveMotorAngleRel('AB',200,1300);
        brick.WaitForMotor('AB');
    elseif distance <= 60
        %turnLeft();
        disp("Turned Left and Checked if front is clear");
        brick.MoveMotorAngleRel('A',50,-240.75);
        brick.MoveMotorAngleRel('B',50,240.75);
        brick.WaitForMotor('AB');
        distance = brick.UltrasonicDist(4);
        if distance > 60
           disp("Front is Clear");
           %turnRightandMoveForward();
           brick.MoveMotorAngleRel('A',50,240.75);
           brick.MoveMotorAngleRel('B',50,-240.75);
           brick.WaitForMotor('AB');
           brick.MoveMotorAngleRel('AB',200,1300);
           brick.WaitForMotor('AB');
        elseif distance <= 60
            disp("Front is not clear");
           %moveForward();
           brick.MoveMotorAngleRel('A',50,-240.75);
           brick.MoveMotorAngleRel('B',50,240.75);
           brick.WaitForMotor('AB');
        end
    end
end
%function turnRightandMoveForward()
   % brick.MoveMotorAngleRel('A',50,240.75);
    %brick.MoveMotorAngleRel('B',50,-240.75);
    %brick.MoveMotorAngleRel('AB',50,1300);
%end
%function turnLeft()
%   brick.MoveMotorAngleRel('A',50,-240.75);
%    brick.MoveMotorAngleRel('B',50,240.75);
%end 
%function moveForward()
%    brick.MoveMotorAngleRel('AB',50,1300);
%end 
    
    
    
    
    
    
    %brick.MoveMotorAngleRel('B',100,200);
    %distance = brick.UltrasonicDist(4);
    %disp(distance);