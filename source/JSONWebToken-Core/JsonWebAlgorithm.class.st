"
Abstract superclass for algorithms used for web encryption

"
Class {
	#name : #JsonWebAlgorithm,
	#superclass : #Object,
	#category : 'JSONWebToken-Core-Algorithms'
}

{ #category : #testing }
JsonWebAlgorithm class >> isAbstract [

	^self name = #JsonWebAlgorithm 
]

{ #category : #'instance creation' }
JsonWebAlgorithm class >> named: aString [ 
	^ self allSubclasses 
		detect: [ :each | each parameterValue = aString ]
]

{ #category : #accessing }
JsonWebAlgorithm class >> parameterValue [
	self shouldBeImplemented 
]
