//
// Generated by Bluespec Compiler (build 785e4e4)
//
// On Tue Nov  3 17:11:30 IST 2020
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
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

  // ports of submodule fa
  wire [1 : 0] fa$fa_out;
  wire fa$fa_out_a, fa$fa_out_b, fa$fa_out_c_in;

  // submodule fa
  mkFA fa(.CLK(CLK),
	  .RST_N(RST_N),
	  .fa_out_a(fa$fa_out_a),
	  .fa_out_b(fa$fa_out_b),
	  .fa_out_c_in(fa$fa_out_c_in),
	  .fa_out(fa$fa_out),
	  .RDY_fa_out());

  // submodule fa
  assign fa$fa_out_a = 1'd1 ;
  assign fa$fa_out_b = 1'd0 ;
  assign fa$fa_out_c_in = 1'd1 ;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    $display("%0x", fa$fa_out);
    $finish(32'd0);
  end
  // synopsys translate_on
endmodule  // mkTb

