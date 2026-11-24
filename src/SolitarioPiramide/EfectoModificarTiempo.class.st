"
Agrega o resta segundos al tiempo restante de una partida según el valor
configurado. Los valores positivos son bonificaciones y los negativos, penalizaciones.
"
Class {
	#name : 'EfectoModificarTiempo',
	#superclass : 'EfectoRey',
	#instVars : [
		'segundos'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'instance creation' }
EfectoModificarTiempo class >> segundos: unosSegundos [
	^ self new
		segundos: unosSegundos;
		yourself.
]

{ #category : 'actions' }
EfectoModificarTiempo >> aplicarEn: unaPartida [
	unaPartida cronometro agregarTiempo: segundos.
]

{ #category : 'testing' }
EfectoModificarTiempo >> esPositivo [
	^ segundos > 0.
]

{ #category : 'accessing' }
EfectoModificarTiempo >> nombre [
	^ segundos > 0
		ifTrue: [ 'Bendición del Tiempo: +' , segundos asString , ' segundos' ]
		ifFalse: [ 'Maldición del Reloj: ' , segundos asString , ' segundos' ].
]

{ #category : 'accessing' }
EfectoModificarTiempo >> segundos: unosSegundos [
	segundos := unosSegundos.
]
