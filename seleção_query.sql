-- Visualizando informações do Banco de dados 'ecommerce'

-- Selecionando o Banco de Dados 'ecommerce'
use ecommerce;

-- Quantidade de clientes
select count(*) as Quantity from clients;
    
-- Quantos pedidos foram realizados?
select count(*) as OrderCount
	from orders;
    
-- Qual a quantidade de pedidos por Categoria de produto?
select Category, count(IdOrder) as OrderCount
	from productOrder po
	inner join product p
		on po.IdProduct = p.IdProduct
	group by Category
    order by OrderCount desc;

-- Quais as formas de pagamentos mais usadas?
select TypePayment, count(*) as TypeCount
    from payments p
    group by TypePayment
    order by TypeCount desc;

-- Qual é o produto mais vendido?
select PName, Category, count(*) as SoldAmount
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct
	group by p.IdProduct
    order by SoldAmount desc;

-- Qual o produto com menor quantidade nos estoques?
select PName, Category, sum(Quantity) as QuantitySumByProduct
	from product p
    inner join productStock ps
		on p.IdProduct = ps.IdProduct
	group by p.IdProduct
	order by QuantitySumByProduct;
    
-- Qual a categoria de produto que cada fornecedor oferece?
select CorporateName, Category
	from product p
    inner join productSuplier ps
		on p.IdProduct = ps.IdProduct
	inner join suplier s
		on s.IdSuplier = ps.IdSuplier
	group by Category, CorporateName;

-- Qual a receita total gerada?
select round(sum(Category * Price), 2) as PriceSum
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct;

-- Qual a receita gerada por cada produto?
select PName, Category, round(sum(Category * Price), 2) as PriceSum
	from product p
    inner join productOrder po
		on p.IdProduct = po.IdProduct
	group by p.IdProduct
    order by PriceSum desc;