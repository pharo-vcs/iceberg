accessing
privateKey
	^ privateKey ifNil: [ privateKey := (FileLocator home asFileReference / '.ssh' / 'id_rsa') pathAsString ]