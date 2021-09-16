//Copyright (C)2014-2021 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.8
//Part Number: GW1NZ-LV1QN48C6/I5
//Device: GW1NZ-1
//Created Time: Thu Sep 16 20:29:18 2021

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_rPLL your_instance_name(
        .clkout(clkout_o), //output clkout
        .clkoutd(clkoutd_o), //output clkoutd
        .clkin(clkin_i) //input clkin
    );

//--------Copy end-------------------
