//
// Generated by Bluespec Compiler (build 785e4e4)
//
// On Tue Nov  3 16:00:18 IST 2020
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 unused
// RST_N                          I     1 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkTb(CLK,
	    RST_N);
  input  CLK;
  input  RST_N;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    $display("Hello World!");
    $finish(32'd0);
  end
  // synopsys translate_on
endmodule  // mkTb

