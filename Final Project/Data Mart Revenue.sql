-- Data Mart Revenue --
select 
	sales.id_distributor as distributor,
	customers.cabang_sales as kota,
	extract(month from sales.tanggal) as bulan,
	round(sum(sales.jumlah_barang)) as jumlah_terjual,
	sum(sales.harga * sales.jumlah_barang) as pendapatan
from
	sales
join
	customers on sales.id_cabang = customers.id_cabang_sales 
group by
	distributor, kota, bulan
order by 
	bulan asc, pendapatan desc