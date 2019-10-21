global key
InitKeyboard();

while 1
    pause(0.1)
    switch key
        case 'uparrow'
            moveForward();
        case 'downarrow'
            moveBackward();        
        case 'leftarrow'
            disp('Left Arrow Pressed');
            
        case 'rightarrow'
            disp('Right Arrow Pressed');
            
        case 0
            disp('No Key Being Pressed')
            
        case 'q'
            break;
            
    end
end
CloseKeyboard();
            
            
            