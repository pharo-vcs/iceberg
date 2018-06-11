accessing
storeFile
	^ StoreFile ifNil: [ StoreFile := FileLocator localDirectory / #iceberg / 'credentials.fuel' ]