# Solitario de Pirámide

Implementación en Smalltalk del clásico juego de cartas **Solitario de Pirámide**, desarrollada como trabajo integrador de Paradigmas de Programación en la Universidad Tecnológica Nacional.

El repositorio contiene la lógica del juego y una interfaz gráfica basada en Morphs para Pharo 13.

## Característica propia: Power-Ups

Al invocar el poder de un Rey libre se aplica uno de seis efectos aleatorios, con tres efectos favorables y tres desfavorables:

- **Bendición del Tiempo:** agrega 25 segundos.
- **Maldición del Reloj:** resta 20 segundos.
- **Tesoro Real:** duplica el puntaje acumulado.
- **Impuesto Real:** reduce el puntaje a la mitad.
- **Golpe Real:** elimina una carta libre al azar.
- **Decreto Real:** consume un reciclaje del mazo auxiliar.

La combinación exacta de **6 + 7** otorga 67 puntos adicionales y ralentiza el cronómetro a 0,5x durante seis segundos reales.

## Integrantes

| Integrante |
| :--- |
| Cabral, Lautaro |
| Carballo Ucero, Bautista |
| De Bortoli, Lautaro Agustín |
| Gonzales, Luis |
| Pedrozo Rios, Tiago Federico |

## Requisitos técnicos

- **Entorno:** Pharo 13.0 de 64 bits.
- **Dependencias:** el proyecto no requiere paquetes externos adicionales.

## Instalación

1. Clonar este repositorio.
2. Abrir Pharo 13.0.
3. Abrir Iceberg desde el World Menu.
4. Seleccionar **Add** y luego **Import from existing clone**.
5. Indicar el directorio raíz del repositorio clonado.
6. En Iceberg, abrir **Packages**, seleccionar **SolitarioPiramide** y cargarlo.
7. Repetir la carga con **SolitarioPiramide-UI** para incorporar la interfaz gráfica.

## Reglas implementadas

- **Disposición:** 28 cartas se distribuyen en siete filas superpuestas. Una carta queda libre cuando no tiene cartas activas debajo que la cubran.
- **Eliminación:** se pueden retirar parejas de cartas libres cuya suma sea exactamente 13. El Rey (K), cuyo valor es 13, se elimina individualmente.
- **Mazo auxiliar:** las cartas restantes se roban una por vez y pasan al descarte. El mazo permite dos reciclajes.
- **Puntaje:** se registran eliminaciones, rachas y bonificaciones.
- **Tiempo:** la partida tiene un límite inicial de cinco minutos, modificable mediante los efectos especiales.
- **Récord:** se conserva el mejor puntaje en un archivo local.

## Organización del código

- **SolitarioPiramide:** modelo de cartas, casillas, pirámide, mazos, reglas de eliminación, puntaje, cronómetro, récord y coordinación de la partida.
- **SolitarioPiramide-UI:** menú de inicio, tablero, cartas gráficas, mazo visible, panel de estado, ayuda y superposición de pausa.
- **Documentación de clases:** consultar [docs/CLASES.md](docs/CLASES.md) para una descripción de las responsabilidades y relaciones entre las clases.
