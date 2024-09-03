delimiter //
	create trigger proibirDeletePermissao
		before delete on Permissao
		for each row
		begin
		SIGNAL sqlstate '45000' set message_text = "Voce nao pode deletar uma permissao";
		end
// delimiter //
	
delimiter //
	create trigger proibirUpdateReservaChurrasqueira
		before update on reservachurrasqueira
        for each row 
        begin 
		SIGNAL sqlstate '45000' set message_text = "Voce nao pode modificar uma reserva da churrasqueira";
		end
// delimiter //
    
delimiter //
	create trigger proibirUpdateReservaQuadra
		before update on reservaquadra
        for each row 
        begin 
		SIGNAL sqlstate '45000' set message_text = "Voce nao pode modificar uma reserva da quadra";
		end
// delimiter //
