/* module HelloWorld(
input clk,		//declaracao das entradas e saidas
output LED1,
output LED2,
output LED3
);

reg [22:0] cnt; //registrador do divisor de clock
reg [2:0] out = 'd1;  //registrador da saida, inicializado como 001

always @(posedge clk) begin
	cnt <= cnt + 22'd1; //realiza a divisao do clock atraves de um contador
end

always @(posedge cnt[22]) begin
	if(out == 'b000) begin
		out <= 'd1;
	end else begin
		out <= out << 1; //desloca para o lado o numero a cada ciclo do contador
	end
end

//abaixo ligamos os leds os respectivos bits de saida
assign LED1 = ~out[0]; //as saidas sao invertidas, entao negamos os bits
assign LED2 = ~out[1];
assign LED3 = ~out[2];
endmodule
*/