private-monticello
unmarkDirtyPackages: aDiff

	dirtyPackages removeAllFoundIn: (aDiff packages collect: #name)