# Documentación de clases

Este documento resume la responsabilidad de cada clase y sus colaboraciones principales. La lógica del dominio está separada de la presentación gráfica para que las reglas puedan mantenerse sin depender de Morphs.

## Paquete SolitarioPiramide

| Clase | Responsabilidad |
|---|---|
| **Carta** | Representa una carta mediante su rango y palo. Calcula su valor, identifica Reyes y determina si dos cartas suman 13. |
| **Casilla** | Representa una posición de la pirámide. Conserva la carta, fila, columna y tablero asociado; determina si está libre, cubierta o eliminada. |
| **Piramide** | Construye las siete filas, consulta casillas por coordenadas, obtiene las cartas libres y detecta combinaciones disponibles. |
| **Mazo** | Mantiene una colección de cartas, permite agregarlas, barajarlas y extraerlas. También crea la baraja del juego. |
| **MazoAuxiliar** | Extiende Mazo con el descarte, la carta visible y el control de reciclajes permitidos. |
| **Partida** | Coordina el estado general, las selecciones, las eliminaciones, los efectos especiales, el tiempo, el puntaje y las condiciones de finalización. |
| **Puntaje** | Acumula puntos por eliminaciones, bonificaciones y rachas consecutivas. |
| **Cronometro** | Administra el límite de tiempo, las pausas, las bonificaciones y penalizaciones temporales, y la ralentización 6-7. |
| **RegistroRecords** | Carga y guarda el mejor puntaje histórico en un archivo local. |
| **Eliminacion** | Define el protocolo abstracto para validar una eliminación y aplicar efectos posteriores. |
| **EliminacionPareja** | Valida la eliminación de dos cartas cuya suma es 13. |
| **EliminacionRey** | Valida la eliminación individual de un Rey. |
| **Eliminacion67** | Especializa la eliminación por pareja para reconocer el seis y el siete y activar su bonificación. |
| **EfectoRey** | Define el protocolo abstracto de los efectos especiales y ofrece la selección aleatoria de un efecto. |
| **EfectoModificarTiempo** | Agrega o resta segundos al cronómetro. |
| **EfectoEscalarPuntaje** | Multiplica o reduce el puntaje acumulado según un factor. |
| **EfectoEliminarCartaLibre** | Elimina una casilla libre elegida al azar y registra la eliminación. |
| **EfectoQuitarReciclaje** | Reduce la cantidad de reciclajes disponibles del mazo auxiliar. |

## Paquete SolitarioPiramide-UI

| Clase | Responsabilidad |
|---|---|
| **PartidaMorph** | Es el Morph raíz de la aplicación. Conecta los componentes gráficos con el modelo Partida y actualiza la pantalla ante cambios de estado. |
| **PiramideMorph** | Dibuja las filas y las cartas de la pirámide; comunica las selecciones y los clics secundarios al controlador. |
| **CartaMorph** | Presenta una carta, su palo, rango, estado de selección y disponibilidad; recibe los eventos del mouse. |
| **MazoMorph** | Presenta el mazo de robo, el descarte visible y la cantidad de cartas y reciclajes restantes. |
| **PanelEstadoMorph** | Muestra puntaje, racha, récord y tiempo; expone las acciones de pausa, reinicio y salida. |
| **MenuInicioMorph** | Presenta el menú inicial y permite iniciar una partida, abrir la ayuda o salir. |
| **OverlayPausaMorph** | Cubre el tablero durante la pausa y ofrece reanudar, consultar las reglas o volver al menú. |
| **AyudaMorph** | Explica las reglas, controles y efectos especiales al jugador. |

## Colaboración principal

1. **Partida** crea y coordina **Piramide**, **MazoAuxiliar**, **Puntaje**, **Cronometro** y **RegistroRecords**.
2. **Piramide** contiene **Casilla**; cada **Casilla** referencia una **Carta** y conoce su posición.
3. **Partida** delega la validación de movimientos a las estrategias **Eliminacion** y sus subclases.
4. Las eliminaciones especiales pueden invocar objetos **EfectoRey**, que modifican el estado mediante los servicios de **Partida**.
5. **PartidaMorph** observa el modelo y coordina **PiramideMorph**, **MazoMorph** y **PanelEstadoMorph**. El menú, la pausa y la ayuda se presentan mediante sus Morphs específicos.
