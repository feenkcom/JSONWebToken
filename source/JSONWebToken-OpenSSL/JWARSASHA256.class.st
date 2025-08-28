"
RSA SHA256 

"
Class {
	#name : #JWARSASHA256,
	#superclass : #JsonWebAlgorithm,
	#category : 'JSONWebToken-OpenSSL'
}

{ #category : #sign }
JWARSASHA256 class >> checkSignature: parts withKey: key [
	| jwtHeaderAndPayload signatureByteArray publicKey |
	jwtHeaderAndPayload := $.
		join:
			{parts first.
			parts second}.
	"signatureByteArray := parts third base64Padded base64Decoded
		asByteArray."
	signatureByteArray := (Base64UrlEncoder new decode: parts third base64Padded)
		asByteArray.
	publicKey := (key includesSubstring: 'BEGIN RSA PUBLIC KEY')
		ifTrue: [ LcEvpPublicKey setRSA:  (LcRSA fromRsaPublicKeyPemString: key) ]
		ifFalse: [ LcEvpPublicKey fromPublicKeyPemString: key ].
	jwtHeaderAndPayload pinInMemory.
	signatureByteArray pinInMemory.
	[ (publicKey
		digestVerifyMessage: jwtHeaderAndPayload
		with: signatureByteArray)
		ifFalse: [ Error signal: 'signature does not match' ] ]
		ensure: [ 
			jwtHeaderAndPayload unpinInMemory.
			signatureByteArray unpinInMemory  ]
]

{ #category : #accessing }
JWARSASHA256 class >> parameterValue [
	^ 'RS256'
]

{ #category : #sign }
JWARSASHA256 class >> signMessage: aString withKey: anObject [

	| pkey sig |
	aString pinInMemory.
	[ 
	pkey := LcEvpPublicKey setRSA: (LcRSA fromPemString: anObject).
	sig := pkey digestSignMessage: aString ] ensure: [ 
		aString unpinInMemory ].

	^ sig
]
