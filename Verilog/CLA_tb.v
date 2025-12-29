module tb;
    reg [4:0] a, b;
    reg clk;
    wire [4:0] sum;
    wire cout;

    CLA_5bit dut(clk, a[4:0], b[4:0], sum[4:0], cout);

    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("project.vcd");
        $dumpvars(0, tb);
        clk = 0;
        a = 22; b = 13;
        $display("a = %b(%d), b = %b(%d)", a, a, b, b);
        #20;
        $display("sum = %b(%d), cout = %b(%d)", sum, sum, cout, cout);
      	a = 15; b = 23;
		$display("sum = %b(%d), cout = %b(%d)", sum, sum, cout, cout);
      	#20;
        $finish;
    end
endmodule