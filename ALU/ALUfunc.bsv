package ALUfunc;

function Bit#(TAdd#(n,1)) addN (Bit#(n) x, Bit#(n) y, Bit#(n) c_in );
	Bit#(n) s;
	Bit#(n) c ={0, c_in};
	for(Integer i=0;i<valueOf(n);i=i+1 )begin
		let cs = full_adder(x[i],y[i],c[i]);
		c[i+1] = cs[1];
		s[i] = cs[0];
	end
	return {c[valueOf(n)],s};
endfunction

function Bit#(2) full_adder(Bit#(1) x, Bit#(1) y, Bit#(1) z);
	Bit#(1) s = (x ^ y) ^ z;
	Bit#(1) c_out = (x & y) | (z & (x ^ y));
	return {c_out, s};
endfunction

function Bit#(TAdd#(n,1)) subN (Bit#(n) x, Bit#(n) y, Bit#(n) c_in );
	let y_n = ~y;	
	Bit#(n) s;
	Bit#(n) c ={0, c_in};
	for(Integer i=0;i<valueOf(n);i=i+1 )begin
		let cs = full_adder(x[i],y_n[i],c[i]);
		c[i+1] = cs[1];
		s[i] = cs[0];
	end
	return {c[valueOf(n)],s};
endfunction 




endpackage: ALUfunc
