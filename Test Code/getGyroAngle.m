% Returns the rotation angle in degrees of the gyro sensor since the last reset.
function a = getGyroAngle(brick)
    a = brick.GyroAngle(3);
end