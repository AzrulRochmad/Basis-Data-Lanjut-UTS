CREATE view RekapPinjam as  SELECT data_sewa.tggl_tran,data_sewa.No_identitas,data_sewa.Nama_penyewa,data_stok.Judul,sum(data_jenis_vcd.tarif),sum(data_sewa.QTY),count(data_sewa.No_tran) from data_sewa join data_stok on data_sewa.kode_vcd=data_stok.kd_vcd join data_jenis_vcd on data_stok.Id_jenis=data_jenis_vcd.ID_Jenis GROUP BY data_sewa.Nama_penyewa;

SELECT*FROM RekapPinjam;