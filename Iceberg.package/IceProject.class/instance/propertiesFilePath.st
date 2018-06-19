accessing
propertiesFilePath

	^ (RelativePath with: self sourceDirectory) resolve: '.properties'.