"
Multiplica el puntaje acumulado de la partida. Se utiliza para representar
tanto el Tesoro Real (factor mayor que uno) como el Impuesto Real (factor menor).
"
Class {
	#name : 'EfectoEscalarPuntaje',
	#superclass : 'EfectoRey',
	#instVars : [
		'factor'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'instance creation' }
EfectoEscalarPuntaje class >> factor: unFactor [
	^ self new
		factor: unFactor;
		yourself.
]

{ #category : 'actions' }
EfectoEscalarPuntaje >> aplicarEn: unaPartida [
	| actual nuevo |
	actual := unaPartida puntaje total.
	nuevo := (actual * factor) rounded.
	unaPartida puntaje sumarBonificacion: (nuevo - actual).
]

{ #category : 'testing' }
EfectoEscalarPuntaje >> esPositivo [
	^ factor > 1.
]

{ #category : 'accessing' }
EfectoEscalarPuntaje >> factor: unFactor [
	factor := unFactor.
]

{ #category : 'accessing' }
EfectoEscalarPuntaje >> nombre [
	^ factor > 1
		ifTrue: [ 'Tesoro Real: ¡Puntaje multiplicado x' , factor asString , '!' ]
		ifFalse: [ 'Impuesto Real: ¡Puntaje reducido a la mitad!' ].
]
