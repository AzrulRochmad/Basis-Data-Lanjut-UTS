CREATE TRIGGER stok BEFORE INSERT ON data_sewa
FOR EACH ROW
BEGIN
UPDATE data_stok
SET stok=stok+new.QTY
WHERE kd_vcd=new.kode_vcd;
END