-- Data Mart Transaction -- 
select 
	product.lini as nama_brand,
	product.nama_barang,
	extract(month from sales.tanggal) as bulan,
	round(sum(sales.jumlah_barang)) as jumlah_terjual,
	sum(sales.harga * sales.jumlah_barang) as pendapatan
from
	sales 
join
	product on sales.id_barang = product.kode_barang 
group by
	nama_brand, nama_barang, bulan 
order by 
	bulan asc, jumlah_terjual desc;