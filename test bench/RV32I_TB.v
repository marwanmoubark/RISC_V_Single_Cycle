module RV32I_TB();
    reg         clk;
    reg         reset;
    wire [31:0] WriteData;
    wire [31:0] DataAdr;
    wire        MemWrite;
    // instantiate device to be tested
    RV32I_TOP dut(
        .clk(clk), 
        .reset(reset), 
        .WriteData(WriteData), 
        .Data_Adr(DataAdr), 
        .MemWrite(MemWrite)
    );
    // initialize test
    initial

     begin
         reset <= 1; 
         # 22; 
         reset <= 0;
     end
    // generate clock to sequence tests
    always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end
    // check results
    always @(negedge clk)
   begin
        if(MemWrite) begin
           if(DataAdr === 32'd100 & WriteData === 32'd25) begin
              $display("Simulation succeeded");
              $stop;
           end else if (DataAdr !== 32'd96) begin
              $display("Simulation failed");
              $stop;
           end
         end
        end

 endmodule