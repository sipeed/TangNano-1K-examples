module TOP
(
	input			Reset_Button,
    input           User_Button,
    input           XTAL_IN,

	output			LCD_CLK,
	output			LCD_HYNC,
	output			LCD_SYNC,
	output			LCD_DEN,
	output	[4:0]	LCD_R,
	output	[5:0]	LCD_G,
	output	[4:0]	LCD_B,

    output          LED_R,
    output          LED_G,
    output          LED_B
);

    Gowin_rPLL Gowin_rPLL_9Mhz(
        .clkout(LCD_CLK), // 9MHz
        .clkin(XTAL_IN)   //27MHz
    );

	VGAMod	VGAMod_inst(
		.PixelClk	(	LCD_CLK		),
		.nRST		(	Reset_Button),

		.LCD_DE		(	LCD_DEN	 	),
		.LCD_HSYNC	(	LCD_HYNC 	),
    	.LCD_VSYNC	(	LCD_SYNC 	),

		.LCD_B		(	LCD_B		),
		.LCD_G		(	LCD_G		),
		.LCD_R		(	LCD_R		)
	);


    //RGB LED TEST
    reg 	[31:0] counter;
    reg     [2:0] led;

    always @(posedge XTAL_IN or negedge Reset_Button) begin
        if (!Reset_Button) begin
            counter <= 31'd0;
            led <= 3'b110;
        end
        else if (counter < 31'd1350_0000)       // 0.5s delay
            counter <= counter + 1;
        else begin
            counter <= 31'd0;
            led[2:0] <= {led[1:0],led[2]};
        end
    end
    assign  LED_R = led[0];
    assign  LED_G = led[1];
    assign  LED_B = led[2];

endmodule