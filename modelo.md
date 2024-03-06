# Tarea: Modelado de Base de Datos

## Identificar Entidades

1. **Supermercados**
   - id_supermercado (PK)
   - nombre_supermercado
   - ubicacion
   - horarios_atencion
   - contacto_telefono
   - contacto_correo

2. **Clientes**
   - id_cliente (PK)
   - nombre
   - apellido
   - cedula
   - correo
   - whatsapp
   - direccion

3. **Aseo y Limpieza**
   - id_producto (PK)
   - nombre
   - precio
   - cantidad
   - id_categoria (FK)

4. ...

## Identificar Atributos

- Atributos identificados en las entidades anteriores.

## Identificar Claves Primarias y Foráneas

- Claves primarias (PK) y foráneas (FK) identificadas en las entidades.

## Identificar Entidades Pivote

- Entidades pivote identificadas (e.g., supermercado_cliente).

## Identificar Catálogos

- Catálogos identificados (e.g., categorias).

## Identificar Tipos de Relaciones

- Tipos de relaciones identificadas (e.g., uno a muchos, muchos a muchos).



erDiagram
    +------------------------+        +------------------------+
    |   supermercados        |        |        clientes        |
    |------------------------|        |------------------------|
    | id_supermercado (PK)   |        | id_cliente (PK)        |
    | nombre_supermercado    |        | nombre                 |
    | ubicacion              |        | apellido               |
    | horarios_atencion      |        | cedula                 |
    | contacto_telefono      |        | correo                 |
    | contacto_correo        |        | whatsapp               |
    +------------------------+        | direccion              |
             |                        +------------------------+
             |
             |1
             |             supermercado_cliente
             |---------------------------------------
             |1                                  |N
    +------------------------+       +------------------------+
    |  aseo_limpieza         |       |    pedidos             |
    |------------------------|       |------------------------|
    | id_producto (PK)       |       | id_pedido (PK)         |
    | nombre                 |       | id_cliente (FK)        |
    | precio                 |       | fecha_pedido           |
    | cantidad               |       | total_pedido           |
    | id_categoria (FK)      |       | estado_pedido          |
    +------------------------+       +------------------------+
             |                                  |
             |                                  |
             |1                                 |1
             |              categorias           |
             |----------------------------------|
             |1                                 |N
    +------------------------+       +------------------------+
    |  enlatados_conservas   |       | panaderia_productos_   |
    |------------------------|       |         horneados       |
    | id_producto (PK)       |       |------------------------|
    | nombre                 |       | id_producto (PK)       |
    | precio                 |       | nombre                 |
    | cantidad               |       | precio                 |
    | id_categoria (FK)      |       | cantidad               |
    +------------------------+       | id_categoria (FK)      |
             |                       +------------------------+
             |1                                  |
             |              bebidas_licores      |
             |----------------------------------|
             |1                                 |N
    +------------------------+       +------------------------+
    |  snacks_alimentos_     |       | cuidado_personal_      |
    |    procesados           |       |     belleza            |
    |------------------------|       |------------------------|
    | id_producto (PK)       |       | id_producto (PK)       |
    | nombre                 |       | nombre                 |
    | precio                 |       | precio                 |
    | cantidad               |       | cantidad               |
    | id_categoria (FK)      |       | id_categoria (FK)      |
    +------------------------+       +------------------------+
             |                                  |
             |1                                 |1
    +------------------------+       +------------------------+
    |  frutas_verduras       |       | articulos_hogar_       |
    |------------------------|       | utensilios_cocina      |
    | id_producto (PK)       |       |------------------------|
    | nombre                 |       | id_producto (PK)       |
    | precio                 |       | nombre                 |
    | cantidad               |       | precio                 |
    | id_categoria (FK)      |       | cantidad               |
    +------------------------+       | id_categoria (FK)      |
             |                       +------------------------+
             |
             |
             |N
             |
    +------------------------+
    | carnes_pescados        |
    |------------------------|
    | id_producto (PK)       |
    | nombre                 |
    | precio                 |
    | cantidad               |
    | id_categoria (FK)      |
    +------------------------+
