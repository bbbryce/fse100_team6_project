brick = SimBrick;
tic
brick.conn.write('SET simulateClutch 1 1');
brick.conn.write('SET motorRange 3 -31 31');
brick.conn.write('SET motorRange 2 -2000 2000');
brick.conn.write('SET driveGearRatio 0.1666666 1.0');
brick.conn.write('SET effectiveWheelbase 4.45');
havePerson = false;
trying = true;
while trying
    distance = brick.UltrasonicDist(4);
    pause(0.1);
    if distance > 60
        disp("Turned Right and Moved Forward");
        turnRight(brick);
        trying = moveForward(brick);
    elseif distance <= 60
        disp("Turned Left and Checked if front is clear");
        turnLeft(brick);
        distance = brick.UltrasonicDist(4);
        if distance > 60
           disp("Front is Clear");
           turnRight(brick);
         trying = moveForward(brick);
        elseif distance <= 60
           disp("Front is not clear");
           turnLeft(brick);
        end
    end
end
toc
function trying = moveForward(brick)
        trying = true;
        brick.MoveMotorAngleAbs('B', 10, -31);
        pause(2);
        brick.MoveMotorAngleRel('A', 500, 7590);
        state = brick.MotorBusy('A');
        while(state)
            color = brick.ColorColor(3);
            if(color == 5)
                disp("Red");
                brick.StopAllMotors();
                pause(5);
                brick.MoveMotorAngleRel('A', 500, 3795);
                pause(2);
            elseif(color == 3)
                disp("Green");
                if(havePerson == true)
                    disp("Drop off Person");
                    trying = false;
                else
                    disp("Dont have Person");
                end
            elseif(color == 4)
                disp("Yellow");
                if(havePerson == false)
                    disp("Picking up the person");
                    havePerson = true;
                else
                    disp("Why am I here?");
                end
            else
                disp("No Color");
            end
            state = brick.MotorBusy('A');
        end
        brick.WaitForMotor('A');
end
function turnRight(brick)
    brick.MoveMotorAngleAbs('B', 10, 31);
    pause(2);
    brick.MoveMotorAngleRel('A', 200, 1085); 
    pause(2);
end
function turnLeft(brick)
    brick.MoveMotorAngleAbs('B', 10, 31); 
    pause(2);
    brick.MoveMotorAngleRel('A', 200, -1085);
    pause(2);
    brick.MoveMotorAngleAbs('B', 10, 31); 
    pause(2);
end
function turnAround(brick)
    turnRight(brick);
    turnRight(brick);
end

