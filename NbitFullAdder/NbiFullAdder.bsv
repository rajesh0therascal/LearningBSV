package NbiFullAdder;

function Bit#(n) addN (Bit#(TSub#(n,1)) x, Bit#(TSub#(n,1)) y, Bit#(TSub#(n,1)) c_in );
	Bit#(TSub#(n,1)) s;
	Bit#(w) c ={0, c_in};
	for(Integer i=0;i<valueOf(w)-1;i=i+1 )begin
		let cs = full_adder(x[i],y[i],c[i]);
		c[i+1] = cs[1];
		s[i] = cs[0];
	end
	return {c[w],s};
endfunction

function Bit#(2) full_adder(Bit#(1) x, Bit#(1) y, Bit#(1) z);
	Bit#(1) s = (x ^ y) ^ z;
	Bit#(1) c_out = (x & y) | (z & (x ^ y));
	return {c_out, s};
endfunction

(* synthesize *)
module mkTb(Empty);

NbiFA_ifc#(8) fa <- mkNbFA();

rule theadd;
$display("%0x", fa.fa_out(1,1,1));
$finish(0);
endrule

endmodule: mkTb


interface NbiFA_ifc#(numeric type n);
	method Bit#(n) fa_out(Bit#(TSub#(n,1)) a, Bit#(TSub#(n,1)) b, Bit#(TSub#(n,1)) c_in);
endinterface: NbiFA_ifc


(*synthesize*)
module mkNbFA(NbiFA_ifc#(n));

	method Bit#(n) fa_out(Bit#(TSub#(n,1)) a, Bit#(TSub#(n,1)) b, Bit#(TSub#(n,1)) c_in);
		return addN(a,b,c_in);
	endmethod

endmodule: mkNbFA

endpackage: NbiFullAdder
