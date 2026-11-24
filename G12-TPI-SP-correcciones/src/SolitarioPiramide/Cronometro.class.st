"
Administra el tiempo de una partida: inicio, pausa, reanudación, bonificaciones
y penalizaciones. También permite aplicar una ralentización temporal al reloj.
"
Class {
	#name : 'Cronometro',
	#superclass : 'Object',
	#instVars : [
		'tiempoLimite',
		'tiempoTranscurrido',
		'corriendo',
		'factorVelocidad',
		'segundosRalentizados'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'actions' }
Cronometro >> activarRalentizacion: duracionRealSeconds factor: unFactor [
	"Durante la duración indicada, cada segundo real cuenta según el factor recibido."
	duracionRealSeconds <= 0 ifTrue: [
		segundosRalentizados := 0.
		factorVelocidad := 1.0.
		^ self ].
	unFactor <= 0 ifTrue: [ self error: 'El factor de velocidad debe ser mayor que cero.' ].
	segundosRalentizados := duracionRealSeconds.
	factorVelocidad := unFactor.
]

{ #category : 'accessing' }
Cronometro >> agregarTiempo: unosSegundos [
	"Un valor positivo agrega tiempo; uno negativo aplica una penalización.
	El tiempo restante puede superar el límite inicial gracias a una bonificación."
	tiempoTranscurrido := tiempoTranscurrido - unosSegundos.
]

{ #category : 'actions' }
Cronometro >> avanzar: unosSegundos [
	| delta segundosEfectivos segundosConEfecto |
	(corriendo and: [ self seAgoto not ]) ifFalse: [ ^ self ].

	delta := unosSegundos max: 0.
	delta = 0 ifTrue: [ ^ self ].
	segundosEfectivos := delta.

	self estaRalentizado ifTrue: [
		"Solo se ralentiza la parte del intervalo que todavía está dentro del efecto."
		segundosConEfecto := segundosRalentizados min: delta.
		segundosEfectivos :=
			(segundosConEfecto * factorVelocidad)
				+ (delta - segundosConEfecto).
		segundosRalentizados := (segundosRalentizados - delta) max: 0.
		segundosRalentizados = 0 ifTrue: [ factorVelocidad := 1.0 ] ].

	tiempoTranscurrido := tiempoTranscurrido + segundosEfectivos.
	^ self
]

{ #category : 'accessing' }
Cronometro >> corriendo [
	^ corriendo.
]

{ #category : 'testing' }
Cronometro >> estaRalentizado [
	^ segundosRalentizados > 0.
]

{ #category : 'initialization' }
Cronometro >> iniciar [
	tiempoTranscurrido := 0.
	corriendo := true.
	factorVelocidad := 1.0.
	segundosRalentizados := 0.
]

{ #category : 'initialization' }
Cronometro >> initialize [
	super initialize.
	tiempoLimite := 300.
	tiempoTranscurrido := 0.
	corriendo := false.
	factorVelocidad := 1.0.
	segundosRalentizados := 0.
]

{ #category : 'actions' }
Cronometro >> pausar [
	corriendo := false.
]

{ #category : 'actions' }
Cronometro >> reanudar [
	corriendo := true.
]

{ #category : 'testing' }
Cronometro >> seAgoto [
	^ self tiempoRestante <= 0.
]

{ #category : 'accessing' }
Cronometro >> tiempoLimite [
	^ tiempoLimite.
]

{ #category : 'accessing' }
Cronometro >> tiempoLimite: unosSegundos [
	tiempoLimite := unosSegundos max: 0.
]

{ #category : 'accessing' }
Cronometro >> tiempoRestante [
	"Devuelve el tiempo disponible, redondeado hacia arriba para la interfaz."
	^ (tiempoLimite - tiempoTranscurrido) ceiling max: 0.
]

{ #category : 'accessing' }
Cronometro >> tiempoTranscurrido [
	"Puede ser negativo cuando se obtuvo una bonificación de tiempo."
	^ tiempoTranscurrido.
]
