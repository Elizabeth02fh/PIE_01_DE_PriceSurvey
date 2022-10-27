use preciosdb;
select * from producto_ok;
select * from sucursal_ok;
select * from tabla_general_ps;

ALTER TABLE producto_ok DROP `index`;
ALTER TABLE producto_ok RENAME COLUMN `id` TO `producto_id`;
ALTER TABLE sucursal_ok DROP `index`;
ALTER TABLE sucursal_ok RENAME COLUMN `id` TO `sucursal_id`;
ALTER TABLE tabla_general_ps RENAME COLUMN `index` TO `precios_semana_id`;

ALTER TABLE producto_ok CHANGE `producto_id` `producto_id` VARCHAR (20);
ALTER TABLE producto_ok CHANGE `marca` `marca` TEXT (20);
ALTER TABLE sucursal_ok CHANGE `sucursal_id` `sucursal_id` VARCHAR (12);

ALTER TABLE tabla_general_ps CHANGE `precios_semana_id` `precios_semana_id` int (7);
ALTER TABLE tabla_general_ps CHANGE `producto_id` `producto_id` VARCHAR (20);
ALTER TABLE tabla_general_ps CHANGE `sucursal_id` `sucursal_id` VARCHAR (12);
#APLICANDO LOS PRIMARY KEYS 1ERO
ALTER TABLE `producto_ok` ADD PRIMARY KEY(`producto_id`);
ALTER TABLE `sucursal_ok` ADD PRIMARY KEY(`sucursal_id`);
ALTER TABLE `tabla_general_ps` ADD PRIMARY KEY(`precios_semana_id`);
#APLICANDO LOS FOREIGN KEY
#si no se puede desahabilitar 
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `tabla_general_ps` ADD FOREIGN KEY (`producto_id`) REFERENCES producto_ok(producto_id);
ALTER TABLE `tabla_general_ps` ADD FOREIGN KEY (`sucursal_id`) REFERENCES sucursal_ok(sucursal_id);
#luego dejarlo en habilitado 
SET FOREIGN_KEY_CHECKS = 1;
#QUERY: Precio promedio de la sucursal 9-1-688.
SELECT avg(precio) FROM tabla_general_ps WHERE sucursal_id = '9-1-688';




