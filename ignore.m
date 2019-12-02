disp("Calibrating Clutch");
brick.MoveMotor('B', -5);
pause(3);
brick.StopAllMotors;
brick.ResetMotorAngle('B')
brick.MoveMotor('B', 5);
pause(3);
brick.StopAllMotors;
P = brick.GetMotorAngle('B');
disp(P);

brick.MoveMotorAngleAbs('B', 5, 0)

disp("Done Calibrating");
pause(5);

havePerson = false;
trying = true;
brickSteps = [];

while trying
    %disp("Am I here");
    distance = brick.UltrasonicDist(2);
    pause(0.1);
    if distance > 60
        disp("Turned Right and Moved Forward");
        brickSteps = [2 brickSteps];
        turnRight(brick,P);
        brickSteps = [1 brickSteps];
       [trying,havePerson,brickSteps] = moveForward(brick,havePerson,brickSteps,P);
    elseif distance <= 60
        disp("Turned Left and Checked if front is clear");
        brickSteps = [3 brickSteps];
        turnLeft(brick,P);
        distance = brick.UltrasonicDist(2);
        if distance > 60
           disp("Front is Clear");
           brickSteps = [2 brickSteps];
           turnRight(brick,P);
           brickSteps = [1 brickSteps];
           [trying,havePerson,brickSteps] = moveForward(brick,havePerson,brickSteps,P);
        elseif distance <= 60
           disp("Front is not clear");
           brickSteps = [3 brickSteps];
           turnLeft(brick,P);
        end
    end
end
function [trying,havePerson,brickSteps] = moveForward(brick,havePerson,brickSteps,P)
        trying = true;
        brick.MoveMotorAngleAbs('B', 5, 0);
        brick.WaitForMotor('B');
        brick.MoveMotorAngleRel('A', 1000, 7590);
        state = brick.MotorBusy('A');
        while(state)
            color = brick.ColorColor(1); 
            if(color == 5)
                disp("Red");
                brick.StopAllMotors();
                pause(5);
                brick.MoveMotorAngleRel('A', 1000, 3795);
                pause(2);
            elseif(color == 3)
                disp("Green");
                if(havePerson == true)
                    disp("Drop off Person");
                    
                    turnRight(brick,P);
                    returnClutch(brick);
                    turnRight(brick,P)
                    brick.MoveMotorAngleRel('A', 30, -3795);
                    
                    brick.MoveMotorAngleRel('c', 50, -950);
                    
                    trying = false;
                else
                    disp("Dont have Person");
                    brickSteps = [];
                end
            elseif(color == 4)
                disp("Yellow");
                if(havePerson == false)
                    disp("Picking up the person")
                    brick.StopAllMotors;
                    disp("Start Pause");
                    pause(3);
                    disp("Pause No More");
                    turnLeft(brick,P);
                    returnClutch(brick);
                    turnLeft(brick,P);
                    brick.MoveMotorAngleAbs('B', 5, 0);
                    brick.WaitForMotor('B');
                    brick.MoveMotorAngleRel('A', 30, -3795);
                    brick.WaitForMotor('A');
                    brick.MoveMotorAngleRel('C', 50, 950);
                    brick.WaitForMotor('C');
                    havePerson = true;
                   % disp(brickSteps);
                    
                else
                    disp("Why am I here?");
                end
            else
                %disp("No Color");
            end
            state = brick.MotorBusy('A');
        end
        brick.WaitForMotor('A');
end
function moveForward2(brick)
        brick.MoveMotorAngleAbs('B', 5, 0);
        brick.WaitForMotor('B');
        brick.MoveMotorAngleRel('A', 1000, 7590);
        state = brick.MotorBusy('A');
        while(state)
            color = brick.ColorColor(1);
            if(color == 5)
                disp("Red");
                brick.StopAllMotors();
                pause(5);
                brick.MoveMotorAngleRel('A', 1000, 3795);
                pause(2);
            elseif(color == 3)
                disp("Green");
            else
                %disp("No Color");
            end
            state = brick.MotorBusy('A');
        end
        brick.WaitForMotor('A');
end
function turnRight(brick,P)
    brick.MoveMotorAngleAbs('B', 5, P);
    brick.WaitForMotor('B');
    brick.MoveMotorAngleRel('A', 100, 1085); 
    brick.WaitForMotor('A');
end
function turnLeft(brick,P)
    brick.MoveMotorAngleAbs('B', 5, P); 
    brick.WaitForMotor('B');
    brick.MoveMotorAngleRel('A', 100, -1085);
    brick.WaitForMotor('A');
    
end
function returnClutch(brick)
    brick.MoveMotorAngleAbs('B', 5, 0); 
    brick.WaitForMotor('B');
end
function beginReturn(brickSteps,brick)
    disp("Starting Return");
    turnRight(brick);
    returnClutch(brick);
    turnRight(brick);
    actualSteps = fixSteps(brickSteps);
    for i = actualSteps
        if i == 1
            disp("Moved Forward");
            moveForward2(brick);
        elseif i == 2
            disp("Turned Left");
            turnLeft(brick);
        elseif i == 3
            disp("Turned Right");
            turnRight(brick);
        end
    end
end
function actualSteps = fixSteps(brickSteps);
    tempSteps = [];
    actualSteps = [];
    i = 1;
    while i < length(brickSteps)-1
        if(brickSteps(i) + brickSteps(i+1) == 5)
            tempSteps = [tempSteps, brickSteps(i+2)];
            i = i+3;
        else 
            tempSteps = [tempSteps,brickSteps(i)];
            i = i+1;
        end
    end
    z = 1;
    while z < length(tempSteps)-1
        if(tempSteps(z) == 3 && tempSteps(z+1) == 3)
            c = z;
            d = 2;
            while c < length(tempSteps)-1
               if(tempSteps(c+d) == tempSteps(c-(d-1)) && tempSteps(c+(d+1)) ~= tempSteps(c-d))
                 d = d+2; 
               elseif(tempSteps(c+d) == tempSteps(c-(d-1)) && tempSteps(c+(d+1)) == tempSteps(c-d))
                 f = 1;
                 while f < z-d
                    actualSteps = [actualSteps, tempSteps(f)];
                    f = f+1;
                 end
                     actualSteps = [actualSteps, 1];
                     f = z + d + 1;
                 while f < length(tempSteps)-1
                    actualSteps = [actualSteps, tempSteps(f)];
                    f = f+1;
                 end
                 c = c + length(tempSteps);
               else
                   c = c+1;
               end
            end
        end
        z = z+1;
    end
end