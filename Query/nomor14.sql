CREATE TRIGGER cocokin_data 
AFTER DELETE 
on data_stok 
for EACH ROW 
BEGIN 
	INSERT INTO 
	data_sewa 
	SET data_stok.kd_vcd=data_sewa.kode_vcd; 
END