-- Create Customers Table --
create table customers(
	id_customer varchar(10) primary key not null,
	level varchar(7),
	nama varchar(25),
	id_cabang_sales varchar(5),
	cabang_sales varchar(20),
	id_group varchar(3),
	group_name varchar(10)
);

-- Create Product Table --
create table product(
	kode_barang varchar(8) primary key not null,
	sektor varchar(1),
	nama_barang varchar(50),
	tipe varchar(4),
	nama_tipe varchar(15),
	kode_lini varchar(3),
	lini varchar(10),
	kemasan varchar(8)
);

-- Create Sales Table --
create table sales(
	id_distributor varchar(3),
	id_cabang varchar(5),
	id_invoice varchar(6),
	tanggal date,
	id_customer varchar(10),
	id_barang varchar(7),
	jumlah_barang numeric(4),
	unit varchar(3),
	harga money,
	mata_uang varchar(3),
	brand_id varchar(7),
	lini varchar(10)
);

-- Create New Column In Sales Table -- 
alter table sales 
add column id_penjualan varchar(20)

-- Create Primary Key In Sales Table --
update sales 
set id_penjualan = concat(right(id_cabang, 2), '-', id_invoice, '-', id_customer);

-- Create Foreign Key In Sales Table -- 
alter table sales 
add constraint fk_product
foreign key (id_barang) references product(kode_barang)

-- Create Foreign Key In Sales Table -- 
alter table sales 
add constraint fk_customers
foreign key (id_customer) references customers(id_customer)