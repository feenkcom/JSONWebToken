sign
checkSignature: parts withKey: key
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