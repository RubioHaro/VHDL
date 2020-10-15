![vhdl](/LOGO.png)

[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/RubioHaro/)
[![PyPI license](https://img.shields.io/pypi/l/ansicolortags.svg)](https://github.com/RubioHaro/VHDL/blob/master/LICENSE)

# VHDL

Very High Speed Integrated Circuit Hardware Description Language

## Reglas

* El primer caracter debe ser una letra
* El ultimo caracter no puede ser un guion bajo
* No puede haber dos guiones bajos seguidos
* No hay sensibilidad para mayúsculas y minúsculas

## Modos

* Modo in:
    - Señales de entrada
    - Sin ningún valor dentro del programa
* Modo out:
    - Señales de salida
    - No pueden leerse

## Tipo

* Bit: Toma valores 0 y 1 lógicos
* Bit_vector: representa un vector de bits
* STD_LOGIC: Standar logic
* STD_LOGIC_VECTOR: Standar logic vector

## Librerías y Paquetes

Coleccion de unidades de diseño compiladas previamente para su posterior uso. Se usan para agilizar el diseño.

## Arquitectura

Determina el comportamiento del diseño. 

## Indice de Programas

1. [Hola Mundo]
2. [Compuerta Or]
3. [Sumador]
4. [Multiplexor]
5. [ALU]
6. [Multiplexor 2]

## Circuitos Combinacionales

* Circuito Combinacional: su salida es sólo función de la entrada.

* Tres sentencias básicas de asignación
    - sentencia de asignación simple: `<=`
    - sentencia de asignación de señal: `with select` (se implementa con un multiplexor). Normalmente tiene prioridad sobre `when else`
    - sentencia de asignación simple: `when else` (se puede hacer lo mismo que con `with select` pero la implementación física es diferente) 

## Multiplexor

El multiplexor (MUX) es un circuito combinacional que tiene varios canales de datos de entrada y solamente un canal de salida. Sólo un canal de la entrada pasará a la salida y este será el que haya sido escogido mediante unas señales de control.

![vhdl](/programas/4.Multiplexor/img/VHDL.png)

### Diagramas

![vhdl](/programas/4.Multiplexor/img/MUX.png)

### Codigo

[ Enlace al codigo ]

### Resultado

Resultado para una C22V10

                                 C22V10
                 __________________________________________
      operador2 =| 1|                                  |24|* not used       
      operador1 =| 2|                                  |23|* not used       
         canal4 =| 3|                                  |22|* not used       
         canal3 =| 4|                                  |21|* not used       
         canal2 =| 5|                                  |20|* not used       
         canal1 =| 6|                                  |19|* not used       
       not used *| 7|                                  |18|* not used       
       not used *| 8|                                  |17|* not used       
       not used *| 9|                                  |16|* not used       
       not used *|10|                                  |15|* not used       
       not used *|11|                                  |14|= salida         
       not used *|12|                                  |13|* not used       
                 __________________________________________

## Diseño de una Unidad Lógico Aritmética

### Especificaciones

Entradas y resultados con 8 bits. Selección de operación con 3 bits.

| Operación | Resultado |
| --------- | --------- |
| 000       | A+B       |
| 001       | A-B       |
| 010       | A and B   |
| 011       | A or B    |
| 100       | A         |
| 101       | B         |
| 110       | not A     |
| 111       | not B     |

### Procedimiento

1. Descripción en VHDL de la ALU usando la sentencia `with select`.
2. Verificación de la sintaxis
3. Síntesis del diseño
4. Simulación del diseño

## Std Logic

| X   | Forcing Unknown |
| --- | --------------- |
| 0   | forcing Low     |
| 1   |                 |
| H   |                 |
| L   |                 |
| W   |                 |
| X   | Forcing Unknown |
| Z   |                 |
| \_  |                 |

## Alias
Construcción Conocida, son como objetos

## Multiplexor 2

El multiplexor (MUX) es un circuito combinacional que tiene varios canales de datos de entrada y solamente un canal de salida. Sólo un canal de la entrada pasará a la salida y este será el que haya sido escogido mediante unas señales de control.

![vhdl](/Programas/6.Multiplexor2/img/VHDL.png)