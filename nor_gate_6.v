module nor_gate_6 (x, y, a,b,c,d,z);
  
  input  x,y,a,b,c,d;
  
  output  z;
  
  assign z = ~(x|y|a|b|c|d) ;
  
  
endmodule
