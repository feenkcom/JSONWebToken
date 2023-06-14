sign
signMessage: aString withKey: anObject

	| pkey sig |
	aString pinInMemory.
	[ 
	pkey := LcEvpPublicKey setRSA: (LcRSA fromPemString: anObject).
	sig := pkey digestSignMessage: aString ] ensure: [ 
		aString unpinInMemory ].

	^ sig