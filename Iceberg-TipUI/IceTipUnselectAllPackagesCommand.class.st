"
Implements the unselect all option behavior in the ""Select New Packages to Load"" Iceberg dialog.

"
Class {
	#name : 'IceTipUnselectAllPackagesCommand',
	#superclass : 'IceTipSelectPackagesCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipUnselectAllPackagesCommand class >> defaultDescription [

	^ 'Opens a dialog to choose select and/or removing new package(s) from the repository'
]

{ #category : 'default' }
IceTipUnselectAllPackagesCommand class >> defaultName [

	^ 'Unselect all packages'
]

{ #category : 'testing' }
IceTipUnselectAllPackagesCommand >> canBeExecuted [
	" Answer <true> if the receiver has items to display "

	| pkgList |

	pkgList := self context packagesList.
 	^ pkgList items isNotEmpty
]

{ #category : 'executing' }
IceTipUnselectAllPackagesCommand >> execute [
	" Private - Unselect all the receiver's packages "

	self context selectedPackages: OrderedCollection empty.
	self packagesList refresh
]

{ #category : 'accessing' }
IceTipUnselectAllPackagesCommand >> iconName [

	^ #checkboxUnselected
]
