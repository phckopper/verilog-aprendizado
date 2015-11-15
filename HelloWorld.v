module HelloWorld(
input clk,		//declaracao das entradas e saidas
output[3:0] LED, //saida pro 4511
output [2:0] display, //saida pros transistores
output blinky //saida pra um led piscante
);

reg [19:0] cnt; //registrador do divisor de clock
reg [3:0] unidades; //meio auto explicativo
reg [3:0] dezenas;
reg [3:0] centenas;
reg [3:0] out = 0;  //registrador da saida
reg [2:0] select = 'b001;
reg blink;

always @(posedge clk) begin
	cnt <= cnt + 19'd1; //realiza a divisao do clock atraves de um contador
end

always @(posedge cnt[12]) begin //vai ciclando os displays. mostra um numero em cada um de cada vez
	if(select == 'b001) begin
		out <= dezenas;
		select <= 'b010;
	end else if (select == 'b010) begin
		out <= centenas;
		select <= 'b100;
	end
	else if (select == 'b100) begin
		out <= unidades;
		select <= 'b001;
	end
end

always @(posedge cnt[18]) begin //faz a logica de incrementar
	if(unidades > 'd9) begin
		unidades <= 0;
		dezenas <= dezenas + 4'd1;
	end else begin
		unidades <= unidades + 4'd1; 
	end
	
	if(dezenas > 'd9) begin
		dezenas <= 0;
		centenas <= centenas + 'd1;
	end
	
	if(centenas > 'd9) begin
		centenas <= 0;
	end
	blink <= ~blink; //blinkaaaaaaaa
end

//liga os registradores as saidas
assign LED = out;
assign display = select;
assign blinky = blink;
endmodule 
