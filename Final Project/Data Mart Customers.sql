-- Data Mart customers --
select 
	customers.cabang_sales as kota,
	customers.nama as nama_mitra,
	customers.group_name as mitra_group,
	count(customers.nama) as jumlah_mitra
from 
	sales
join
	customers on sales.id_customer = customers.id_customer 
where
	extract(month from sales.tanggal) = 1
group by 
	kota, nama_mitra, mitra_group
order by 
	jumlah_mitra desc