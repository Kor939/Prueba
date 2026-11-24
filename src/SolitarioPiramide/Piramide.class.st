"
Construye y mantiene la disposición de siete filas del Solitario de Pirámide.
Permite consultar casillas, cartas libres y combinaciones disponibles.
"
Class {
	#name : 'Piramide',
	#superclass : 'Object',
	#instVars : [
		'casillas',
		'cantidadFilas'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'initialization' }
Piramide >> armarCon: unMazo [
	"Distribuye 28 cartas en siete filas; verifica el mazo antes de modificar el tablero."
	| cartasNecesarias |
	unMazo ifNil: [ self error: 'No se puede armar la pirámide sin un mazo.' ].
	cartasNecesarias := (cantidadFilas * (cantidadFilas + 1)) // 2.
	unMazo cantidadCartas < cartasNecesarias
		ifTrue: [ self error: 'El mazo no contiene suficientes cartas para armar la pirámide.' ].

	casillas removeAll.
	1 to: cantidadFilas do: [ :fila |
		1 to: fila do: [ :columna |
			| carta nuevaCasilla |
			carta := unMazo sacarCarta.
			nuevaCasilla := Casilla new
				carta: carta
				fila: fila
				columna: columna
				piramide: self.
			casillas add: nuevaCasilla ] ].
	^ self
]

{ #category : 'accessing' }
Piramide >> cantidadFilas [
	^ cantidadFilas.
]

{ #category : 'accessing' }
Piramide >> casillaEn: unaFila columna: unaColumna [
	"Busca la casilla en una posición, o devuelve nil si esa posición no existe."
	^ casillas
		detect: [ :casilla |
			casilla fila = unaFila and: [ casilla columna = unaColumna ] ]
		ifNone: [ nil ].
]

{ #category : 'accessing' }
Piramide >> casillas [
	^ casillas.
]

{ #category : 'accessing' }
Piramide >> casillasLibres [
	^ casillas select: [ :casilla | casilla esLibre ].
]

{ #category : 'testing' }
Piramide >> estaVacia [
	^ casillas allSatisfy: [ :casilla | casilla estaEliminada ].
]

{ #category : 'accessing' }
Piramide >> filas [
	^ (1 to: cantidadFilas) collect: [ :numeroFila |
		casillas select: [ :casilla | casilla fila = numeroFila ] ].
]

{ #category : 'testing' }
Piramide >> hayCombinacionPosible [
	"Comprueba si hay un Rey libre o dos casillas libres que sumen trece."
	| libres |
	libres := self casillasLibres.
	(libres anySatisfy: [ :casilla | casilla carta esRey ]) ifTrue: [ ^ true ].

	1 to: libres size do: [ :indice |
		indice + 1 to: libres size do: [ :otroIndice |
			((libres at: indice) carta suma13Con: (libres at: otroIndice) carta)
				ifTrue: [ ^ true ] ] ].
	^ false.
]

{ #category : 'initialization' }
Piramide >> initialize [
	super initialize.
	cantidadFilas := 7.
	casillas := OrderedCollection new.
]
