"Adding this to pass a release test that does not has sense to run here"
(FileLocator imageDirectory / 'pharo.version') writeStreamDo: [ :stream | 
	stream << (SystemVersion current major asString,  SystemVersion current minor asString) ]
