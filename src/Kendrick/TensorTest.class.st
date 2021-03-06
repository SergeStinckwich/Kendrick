Class {
	#name : #TensorTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tensor'
}

{ #category : #tests }
TensorTest >> testArray [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 array equals: #( 1 2 3 4 5 6 7 8 ).

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self
		assert: t2 array
		equals: #( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )
]

{ #category : #tests }
TensorTest >> testCreateScalarTensor [

	| s |
	s := Tensor newWith: 2.
	self assert: (s get: #(  )) equals: 2.
	self should: [ s get: #( 1 1 ) ] raise: Error.
	self assert: s rank equals: 0.
	s set: #(  ) value: 1.
	self assert: (s get: #(  )) equals: 1.
	self assert: s shape equals: #(  ).
	self assert: s size equals: 1
]

{ #category : #tests }
TensorTest >> testFirst [

	| a b |
	a := Tensor rows: (1 to: 6) asArray.
	self assert: a first equals: #( 1).
	b := a reshape: #( 3 2 ).
	self assert: b first equals: #( 1 1 )
]

{ #category : #tests }
TensorTest >> testGet [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 get: #( 2 2 )) equals: 6.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 get: #( 3 2 1 )) equals: 11.
	
	self should:[t1 get: #( 4 4 )] raise:Error
]

{ #category : #test }
TensorTest >> testGetPosition [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: (t1 getPosition: #( 1 2 )) equals: 2.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: (t2 getPosition: #( 1 2 2 )) equals: 4
]

{ #category : #tests }
TensorTest >> testRank [

	| t1 t2 |
	
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 rank equals: 2.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 rank equals: 3
]

{ #category : #tests }
TensorTest >> testReshape [

	| t t1 |
	t := Tensor rows: #( #( 0 1 ) #( 2 3 ) #( 4 5 ) ).
	t1 := t reshape: #( 2 3 ).

	self assert: t shape equals: #( 3 2 ).
	self assert: t1 shape equals: #( 2 3 ).
	self assert: t1 array == t array equals: true
]

{ #category : #tests }
TensorTest >> testRows [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 class equals: Tensor.
	
	t2 := Tensor rows: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 class equals: Tensor.
	
]

{ #category : #tests }
TensorTest >> testSetValue [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	t1 set: #( 2 2 ) value: 3.
	self assert: (t1 get: #( 2 2 ) ) equals: 3.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) )
							#( #( 5 6 ) #( 7 8 ) )
		         			#( #( 9 10 ) #( 11 12 ) )
							#( #( 13 14 ) #( 15 16 ) ) ).
	t2 set: #( 2 2 1) value: 10.
	self assert: (t2 get: #( 2 2 1 )) equals: 10
]

{ #category : #tests }
TensorTest >> testShape [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) 
								#( 5 6 7 8 ) ).
	self assert: t1 shape equals: #( 2 4 ).

	t2 := Tensor rows: #( #( #( 1 1 ) #( 2 2 ) )
								#( #( 3 3 ) #( 4 4 ) )
		         				#( #( 4 4 ) #( 4 4 ) )
								#( #( 4 4 ) #( 4 4 ) ) ).
	self assert: t2 shape equals: #( 4 2 2 )
]

{ #category : #tests }
TensorTest >> testSize [

	| t1 t2 |
	t1 := Tensor rows: #( #( 1 2 3 4 ) #( 5 6 7 8 ) ).
	self assert: t1 size equals: 8.

	t2 := Tensor rows: #( #( #( 1 2 ) #( 3 4 ) ) #( #( 5 6 ) #( 7 8 ) )
		         #( #( 9 10 ) #( 11 12 ) ) #( #( 13 14 ) #( 15 16 ) ) ).
	self assert: t2 size equals: 16
]

{ #category : #tests }
TensorTest >> testStrides [

	| a b |
	a := Tensor rows: (1 to: 24) asArray.
	self assert: a strides equals: #( 1 ).
	b := a reshape: #( 4 6 ).
	self assert: b strides equals: #( 6 1 ).
	b := a reshape: #( 6 4 ).
	self assert: b strides equals: #( 4 1 ).
		self assert: (b getPosition: #( 4 2 )) equals: 14.
	b := a reshape: #( 3 4 2 ).
	self assert: b strides equals: #( 8 2 1 ).
	self assert: (b getPosition: #( 3 2 1)) equals: 19.
	b := a reshape: #( 2 3 4 ).
	self assert: b strides equals: #( 12 4 1 ).
	self assert: (b getPosition: #( 2 2 3 )) equals: 19
]

{ #category : #tests }
TensorTest >> testView [

	| t t1 |
	t := Tensor rows:
		     #( #( 10 11 12 ) #( 13 14 15 ) #( 16 17 18 ) #( #( 20 21 22 )
		           #( 23 24 25 ) #( 26 27 28 ) )
		        #( #( 30 31 32 ) #( 33 34 35 ) #( 36 37 38 ) ) ).
	t1 := t view.
	self assert: t array == t1 array equals: true.
	self assert: t shape equals: t1 shape.
	self assert: t shape == t1 shape equals: false.
	self assert: t strides equals: t1 strides.
	self assert: t strides == t1 strides equals: false.
	self assert: t first equals: t1 first.
	self assert: t first == t1 first equals: false.

]
