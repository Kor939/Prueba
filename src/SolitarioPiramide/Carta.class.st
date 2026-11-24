"
Representa una carta de la baraja. Encapsula su rango y palo, calcula su valor
numérico y ofrece las operaciones necesarias para las reglas del Solitario.
"
Class {
	#name : 'Carta',
	#superclass : 'Object',
	#instVars : [
		'rango',
		'palo',
		'bocaArriba'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'instance creation' }
Carta class >> rango: unRango palo: unPalo [
	^ self new
		rango: unRango palo: unPalo;
		yourself.
]

{ #category : 'accessing' }
Carta >> esPaloRojo [
	^ #( #corazones #diamantes ) includes: palo
]

{ #category : 'testing' }
Carta >> esRey [
	^ self valor = 13.
]

{ #category : 'initialization' }
Carta >> initialize [
	super initialize.
	bocaArriba := true.
]

{ #category : 'accessing' }
Carta >> palo [
	^ palo.
]

{ #category : 'printing' }
Carta >> printOn: aStream [
	aStream
		nextPutAll: rango asString;
		nextPutAll: ' de ';
		nextPutAll: palo asString.
]

{ #category : 'accessing' }
Carta >> rango [
	^ rango.
]

{ #category : 'initialization' }
Carta >> rango: unRango palo: unPalo [
	rango := unRango.
	palo := unPalo.
]

{ #category : 'testing' }
Carta >> suma13Con: otraCarta [
	otraCarta ifNil: [ ^ false ].
	^ (self valor + otraCarta valor) = 13.
]

{ #category : 'accessing' }
Carta >> valor [
	rango = 'A' ifTrue: [ ^ 1 ].
	rango = 'J' ifTrue: [ ^ 11 ].
	rango = 'Q' ifTrue: [ ^ 12 ].
	rango = 'K' ifTrue: [ ^ 13 ].
	rango isNumber ifTrue: [ ^ rango ].
	^ rango asInteger.
]
