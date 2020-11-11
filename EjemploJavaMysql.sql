drop database if exists dbUsuarios;
create database dbUsuarios;

use dbUsuarios;

create table tblUsuarios(

	idUsuario int primary key not null,
    Usuario nvarchar(60) not null,
    Contrasena nvarchar(60) not null

);

select * from tblUsuarios;

drop procedure if exists spInsertarUsuario;
drop procedure if exists spConsultarUsuarios;
truncate table tblUsuarios;
delimiter //

	create procedure spInsertarUsuario(Usuarioxd nvarchar(60), Contrasenaxd nvarchar(60))
    BEGIN
    
		declare idSiguiente int;
        set idSiguiente = ifnull((Select MAX(idUsuario) from tblUsuarios),0)+1;
		Insert into tblUsuarios values(idSiguiente,Usuarioxd, md5(Contrasenaxd));
    
    END //

	create procedure spConsultarUsuarios()
    BEGIN
    
		Select * from tblUsuarios;
    
    END //

delimiter ;


call spConsultarUsuarios();

