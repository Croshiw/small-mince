Class {
	#name : #SMListValue,
	#superclass : #SMAbstractValue,
	#instVars : [
		'theValues'
	],
	#category : #'SmallMince-Core-Model'
}

{ #category : #'instance creation' }
SMListValue class >> with: anObject [
	| obj |
	obj := super with: anObject.
	obj theValues: (anObject collect: [ :x | x sm_valueReference ]).
	^ obj
]

{ #category : #comparing }
SMListValue >> = anObject [
	super = anObject ifFalse: [ ^ false ].
	^ theValues = anObject theValues
]

{ #category : #'as yet unclassified' }
SMListValue >> areAllPrimitive [
	^ theValues allSatisfy: #isTGPrimitive
]

{ #category : #accessing }
SMListValue >> copy [
	| clone |
	clone := super copy.
	^ clone
		theValues: (self theValues collect: #copy);
		yourself
]

{ #category : #comparing }
SMListValue >> hash [
	^ theValues hash
]

{ #category : #'as yet unclassified' }
SMListValue >> synthesisBy: aSynthesizer [
	^ aSynthesizer synthesisListValue: self
]

{ #category : #accessing }
SMListValue >> theValues [
	^ theValues
]

{ #category : #accessing }
SMListValue >> theValues: anObject [
	theValues := anObject
]

{ #category : #accessing }
SMListValue >> valueAt: key [ 
	^ theValues at: key
]