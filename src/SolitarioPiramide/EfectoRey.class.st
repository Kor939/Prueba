"
Clase abstracta para los efectos especiales que pueden activarse al invocar
el poder de un Rey. Sus subclases implementan los efectos concretos.
"
Class {
	#name : 'EfectoRey',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'esPositivo'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'instance creation' }
EfectoRey class >> aleatorio [
	"Los seis efectos tienen la misma probabilidad: tres positivos y tres negativos."
	| opciones |
	opciones := {
		EfectoModificarTiempo segundos: 25.
		EfectoModificarTiempo segundos: -20.
		EfectoEscalarPuntaje factor: 2.0.
		EfectoEscalarPuntaje factor: 0.5.
		EfectoEliminarCartaLibre new.
		EfectoQuitarReciclaje new
	}.
	^ opciones atRandom.
]

{ #category : 'actions' }
EfectoRey >> aplicarEn: unaPartida [
	self subclassResponsibility.
]

{ #category : 'testing' }
EfectoRey >> esPositivo [
	^ esPositivo.
]

{ #category : 'accessing' }
EfectoRey >> nombre [
	^ nombre.
]
