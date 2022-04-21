CREATE view RekapStok as  SELECT data_stok.Judul, data_kategori_vcd.kategori,data_jenis_vcd.Jenis,data_jenis_vcd.tarif from data_stok join data_kategori_vcd ON data_stok.Id_kategori=data_kategori_vcd.id_kategori JOIN data_jenis_vcd on data_stok.Id_jenis=data_jenis_vcd.ID_Jenis;

SELECT*FROM RekapStok