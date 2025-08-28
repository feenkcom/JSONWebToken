"
A JSON Web signature serializer serializing in a more
compact Base-64 encoded format (using double dispatching)


"
Class {
	#name : #JWSCompactSerializer,
	#superclass : #JWSSerializer,
	#category : 'JSONWebToken-Core-Serialization'
}

{ #category : #reading }
JWSCompactSerializer >> materialize: aString key: aKeyString [
	^ self materialize: aString key: aKeyString checkSignature: true 
]

{ #category : #reading }
JWSCompactSerializer >> materialize: aString key: aKeyString checkSignature: checkSignature [

	| parts header jws |

	parts := $. split: aString.
	header := JWSHeader fromJson: ( self base64Decoded: parts first ) utf8Decoded.
	jws := JsonWebSignature new
		key: aKeyString;
		setProtectedHeader: header.
	checkSignature
		ifTrue: [ jws checkSignature: parts ].
	^ jws payload: ( JWTClaimsSet fromJson: ( self base64Decoded: parts second ) utf8Decoded )
]

{ #category : #serialization }
JWSCompactSerializer >> serialize: aWebSignature [
	| signature |
	aWebSignature writeProtectedHeaderOn: self.
	stream nextPut: $. .
	aWebSignature writePayloadOn: self.
	
	signature := aWebSignature signatureFor: stream contents.
	stream
		nextPut: $.;
		nextPutAll: (self base64Encoded: signature).
	^ stream contents
]

{ #category : #writing }
JWSCompactSerializer >> writeHeader: aHeader [ 
	stream nextPutAll: (self base64Encoded: aHeader asJson asByteArray) 

]

{ #category : #writing }
JWSCompactSerializer >> writePayload: anObject [
	stream nextPutAll: (self base64Encoded: anObject asJson asByteArray) 
]
