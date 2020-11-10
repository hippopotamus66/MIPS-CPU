module nand_gate_6 (a, b, c, d, x, y, z); //actually six
  
  input x, y, a, b, c, d;
  output  z;
  
  assign z = ~(x&y&a&b&c&d) ;
  
  
endmodule