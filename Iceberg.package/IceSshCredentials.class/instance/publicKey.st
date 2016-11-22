accessing
publicKey
	^ publicKey ifNil: [ publicKey := (FileLocator home asFileReference / '.ssh' / 'id_rsa.pub') pathAsString ]