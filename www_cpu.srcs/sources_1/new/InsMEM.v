
module InsMEM(
        (* DONT_TOUCH = "1" *)input [31:0] PC,      
        output reg[6:0] op,    
        output reg[2:0] funct3,  
        output reg[6:0] funct7, 
        output reg[4:0] addr_rs1,     
        output reg[4:0] addr_rs2,     
        output reg[4:0] addr_rd,       
        output reg[31:0] instr  
    );
reg [31:0]rom[256:0];   //一条指令四字节
initial begin
  
    $readmemh("F:/qq file/test3.txt", rom);
    
end

   always@(PC)
    	begin
            instr=rom[PC];
    	end 
    
    
always@(instr) 
    	begin
        op = instr[6:0];
        addr_rs1 =(op==7'b0110111)?0: instr[19:15];   //lui无需rs1
        addr_rs2 = instr[24:20];
        addr_rd = instr[11:7];
        funct3 = instr[14:12];
        funct7 = instr[31:25];
	end
endmodule
