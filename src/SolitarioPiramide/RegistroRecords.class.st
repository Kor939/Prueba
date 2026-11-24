"
Lee, conserva y persiste el mejor puntaje histórico. La ubicación del archivo
puede configurarse para facilitar pruebas y separar datos de cada entorno.
"
Class {
	#name : 'RegistroRecords',
	#superclass : 'Object',
	#instVars : [
		'mejorPuntaje',
		'archivo'
	],
	#category : 'SolitarioPiramide',
	#package : 'SolitarioPiramide'
}

{ #category : 'accessing' }
RegistroRecords >> archivo [
	^ archivo.
]

{ #category : 'accessing' }
RegistroRecords >> archivo: unFileReference [
	"Permite cambiar la ruta del archivo, por ejemplo para pruebas automatizadas."
	archivo := unFileReference.
]

{ #category : 'operation' }
RegistroRecords >> cargar [
	"Lee el récord existente. Un archivo vacío, inválido o inaccesible se trata como cero."
	archivo exists
		ifTrue: [
			mejorPuntaje := [
				(archivo contents trimBoth) asInteger max: 0
			] on: Error do: [ :error | 0 ] ]
		ifFalse: [
			mejorPuntaje := 0 ].
	^ mejorPuntaje
]

{ #category : 'operation' }
RegistroRecords >> guardar [
	"Persiste el récord actual en el archivo configurado."
	archivo ensureDelete.
	archivo writeStreamDo: [ :stream |
		stream nextPutAll: mejorPuntaje asString ].
]

{ #category : 'initialization' }
RegistroRecords >> initialize [
	super initialize.
	mejorPuntaje := 0.
	archivo := 'solitario_piramide_record.txt' asFileReference.
]

{ #category : 'accessing' }
RegistroRecords >> mejorPuntaje [
	^ mejorPuntaje.
]

{ #category : 'accessing' }
RegistroRecords >> record [
	^ mejorPuntaje.
]

{ #category : 'operation' }
RegistroRecords >> registrar: unPuntaje [
	unPuntaje > mejorPuntaje ifFalse: [ ^ self ].
	mejorPuntaje := unPuntaje.
	self guardar.
]
