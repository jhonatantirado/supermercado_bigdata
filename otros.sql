SELECT v.*,p.nombre producto,tp.nombre tipo_producto,t.nombre tienda,d.nombre distrito FROM venta v 
inner join producto p on p.producto=v.producto
inner join tipo_producto tp on tp.tipo_producto=p.tipo_producto
inner join tienda t on t.tienda=v.tienda
inner join distrito d on d.distrito=t.distrito
where t.nombre IN ('TIENDA SAN MIGUEL MARINA','TIENDA MIRAFLORES LARCO') 
AND tp.nombre = 'ABARROTES'
AND p.nombre IN ('ARROZ','ATUN');

SELECT case v.moneda  when 'USD' then v.precio*3.32 
when 'PEN' then v.precio
end soles,
case v.moneda  when 'USD' then v.precio 
when 'PEN' then v.precio/3.32
end dolares,
p.nombre producto,tp.nombre tipo_producto,t.nombre tienda,d.nombre distrito FROM venta v 
inner join producto p on p.producto=v.producto
inner join tipo_producto tp on tp.tipo_producto=p.tipo_producto
inner join tienda t on t.tienda=v.tienda
inner join distrito d on d.distrito=t.distrito
where t.nombre IN ('TIENDA SAN MIGUEL MARINA','TIENDA MIRAFLORES LARCO') 
AND tp.nombre = 'ABARROTES'
AND p.nombre IN ('ARROZ','ATUN');

select cte.tienda,sum(soles),sum(dolares) from
(
SELECT t.nombre tienda, case v.moneda  when 'USD' then v.precio*3.32
when 'PEN' then v.precio
end soles,
case v.moneda  when 'USD' then v.precio 
when 'PEN' then v.precio/3.32
end dolares
 FROM venta v 
inner join tienda t on t.tienda=v.tienda
where t.nombre IN ('TIENDA SAN MIGUEL MARINA','TIENDA MIRAFLORES LARCO') 
) cte
group by cte.tienda ;

SELECT * FROM total_Venta where nombre_producto IN ('ARROZ','ATUN') AND TIPO_PRODUCTO=1 and nombre_tienda='TIENDA SAN MIGUEL MARINA' ;

select count(*) from venta where procesado='S';
select count(*) from total_venta;
select * from total_venta;