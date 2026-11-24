"
Representa una posición de la pirámide. Mantiene su carta, coordenadas y
referencia al tablero para determinar si está libre, cubierta o eliminada.
"
Class {
	#name : 'Casilla',
	#superclass : 'Object',
	#instVars : [
		'carta',
		'fila',
		'columna',
		'eliminada',
		'piramide'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'accessing' }
Casilla >> carta [
	^ carta.
]

{ #category : 'initialization' }
Casilla >> carta: unaCarta fila: unaFila columna: unaColumna piramide: unaPiramide [
	carta := unaCarta.
	fila := unaFila.
	columna := unaColumna.
	piramide := unaPiramide.
	^ self
]

{ #category : 'private' }
Casilla >> casillasQueLaCubren [
	"Devuelve las dos casillas de la fila inferior que pueden cubrirla."
	| hijas |
	hijas := OrderedCollection new.
	fila < piramide cantidadFilas ifTrue: [
		(piramide casillaEn: fila + 1 columna: columna)
			ifNotNil: [ :casillaHija | hijas add: casillaHija ].
		(piramide casillaEn: fila + 1 columna: columna + 1)
			ifNotNil: [ :casillaHija | hijas add: casillaHija ] ].
	^ hijas.
]

{ #category : 'accessing' }
Casilla >> columna [
	^ columna.
]

{ #category : 'actions' }
Casilla >> eliminar [
	eliminada := true.
]

{ #category : 'testing' }
Casilla >> esLibre [
	"Una casilla solo es seleccionable si contiene una carta activa y no está cubierta."
	^ self estaVacia not and: [ self estaCubierta not ].
]

{ #category : 'testing' }
Casilla >> estaCubierta [
	"Una carta permanece cubierta mientras alguna de sus casillas hijas siga activa."
	^ self casillasQueLaCubren
		anySatisfy: [ :cadaHija | cadaHija estaVacia not ].
]

{ #category : 'testing' }
Casilla >> estaEliminada [
	^ eliminada.
]

{ #category : 'testing' }
Casilla >> estaVacia [
	^ carta isNil or: [ eliminada ].
]

{ #category : 'accessing' }
Casilla >> fila [
	^ fila.
]

{ #category : 'initialization' }
Casilla >> initialize [
	super initialize.
	eliminada := false.
]

{ #category : 'accessing' }
Casilla >> piramide [
	^ piramide.
]
