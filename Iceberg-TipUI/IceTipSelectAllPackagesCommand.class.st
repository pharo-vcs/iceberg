"
Implements the select all option behavior in the ""Select New Packages to Load"" Iceberg dialog.

"
Class {
	#name : #IceTipSelectAllPackagesCommand,
	#superclass : #IceTipSelectPackagesCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #default }
IceTipSelectAllPackagesCommand class >> defaultDescription [

	^ 'Opens a dialog to choose select and/or removing new package(s) from the repository'
]

{ #category : #default }
IceTipSelectAllPackagesCommand class >> defaultName [

	^ 'Select all packages'
]

{ #category : #testing }
IceTipSelectAllPackagesCommand >> canBeExecuted [
	" Answer <true> if the receiver has items to display and they are not all selected "

	| pkgList |

	pkgList := self context packagesList.
 	^ pkgList items notEmpty and: [ pkgList items size ~= pkgList selectedItems size ]
]

{ #category : #executing }
IceTipSelectAllPackagesCommand >> execute [
	" Private - Select all the receiver's packages "

	self packagesList items
		do: [ : pkgItem |
			self packagesListSelectionColumn
				select: [ : c | c isKindOf: SpCheckBoxTableColumn ]
				thenDo: [ : c | c onActivation cull: pkgItem ] ]
		displayingProgress: [ : pkgItem | 'Selecting ' , pkgItem name ].
	self packagesList refresh
]

{ #category : #accessing }
IceTipSelectAllPackagesCommand >> iconName [

	^ #checkboxSelected
]
