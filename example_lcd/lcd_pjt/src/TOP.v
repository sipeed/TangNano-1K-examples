module TOP
(
	input			nRST,
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
    output          LED_B,
    input           KEY

);

	wire		CLK_SYS;	
	wire		CLK_PIX;

    wire        oscout_o;

    Gowin_rPLL chip_pll(
        .clkout(CLK_SYS), //output clkout      //200M
        .clkoutd(CLK_PIX), //output clkoutd   //33.33M
        .clkin(XTAL_IN) //input clkin
    );	


	VGAMod	D1
	(
		.CLK		(	CLK_SYS     ),
		.nRST		(	nRST		),

		.PixelClk	(	CLK_PIX		),
		.LCD_DE		(	LCD_DEN	 	),
		.LCD_HSYNC	(	LCD_HYNC 	),
    	.LCD_VSYNC	(	LCD_SYNC 	),

		.LCD_B		(	LCD_B		),
		.LCD_G		(	LCD_G		),
		.LCD_R		(	LCD_R		)
	);

	assign		LCD_CLK		=	CLK_PIX;

    //RGB LED TEST
    reg 	[31:0] counter;
    reg     [2:0] led;

    always @(posedge XTAL_IN or negedge nRST) begin
        if (!nRST) begin
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