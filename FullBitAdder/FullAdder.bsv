package FullAdder;

(* synthesize *)
module mkTb(Empty);

FA_ifc fa <- mkFA;

rule theadd;
$display("%0x", fa.fa_out(1,1,1));
$finish(0);
endrule

endmodule: mkTb


interface FA_ifc;
	method Bit#(2) fa_out (Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
endinterface: FA_ifc

(* synthesize *)
module mkFA(FA_ifc);
	
	function Bit#(2) full_adder(Bit#(1) x, Bit#(1) y, Bit#(1) z);
		Bit#(1) s = (x ^ y) ^ z;
		Bit#(1) c_out = (x & y) | (z & (x ^ y));
		return {c_out, s};
	endfunction

	method Bit#(2) fa_out (Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
		return full_adder(a,b,c_in);
	endmethod

endmodule: mkFA

endpackage: FullAdder
