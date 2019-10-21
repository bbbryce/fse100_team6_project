% Returns the speed of rotation of the gyro sensor in degrees per second.
function a = getGyroAngleRate(brick)
    a = brick.GyroRate(3);
end