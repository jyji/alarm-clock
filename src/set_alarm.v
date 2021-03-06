`timescale 1ns / 1ps

module set_alarm(
    input signal,
    input load,
    input moveRightBtn, moveLeftBtn, incrementBtn, decrementBtn,
    output reg [3:0] load_seconds,
    output reg [2:0] load_minutes
    );
    
    reg currentPos = 0;

    always@ (posedge signal) begin
        if(load) begin
            if(moveRightBtn || moveLeftBtn)
                currentPos = ~currentPos;
            if(currentPos == 0) begin
                if(incrementBtn) begin
                    if(load_seconds == 9)
                        load_seconds = 0;
                    else
                        load_seconds = load_seconds + 1;
                end
                if(decrementBtn) begin
                    if(load_seconds == 0)
                        load_seconds = 9;
                    else
                        load_seconds = load_seconds - 1;
                end
            end
            else if(currentPos == 1) begin
                if(incrementBtn) begin
                    if(load_minutes == 5)
                        load_minutes = 0;
                    else
                        load_minutes = load_minutes + 1;
                end
                if(decrementBtn) begin
                    if(load_minutes == 0)
                        load_minutes = 5;
                    else
                        load_minutes = load_minutes - 1;
                end
            end     
        end
    end
endmodule
