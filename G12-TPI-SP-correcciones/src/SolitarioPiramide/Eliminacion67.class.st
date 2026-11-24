"
Especialización de EliminacionPareja que reconoce la combinación exacta de
un seis y un siete. Al aplicarse activa la bonificación propia del juego.
"
Class {
	#name : 'Eliminacion67',
	#superclass : 'EliminacionPareja',
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'actions' }
Eliminacion67 >> aplicarEfectoExtraEn: unaPartida [
	unaPartida activarComboSeisSiete.
]

{ #category : 'operation' }
Eliminacion67 >> esValidaPara: unasCartas [
	| valores |
	(super esValidaPara: unasCartas) ifFalse: [ ^ false ].
	valores := unasCartas collect: [ :carta | carta valor ].
	^ (valores includes: 6) and: [ valores includes: 7 ].
]
