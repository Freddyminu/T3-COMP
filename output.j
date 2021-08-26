.class public output
.super java/lang/Object
.method public <init>()V
	aload_0
	invokenonvirtual java/lang/Object/<init>()V
	return
.end method
.method public static main([Ljava/lang/String;)V
	.limit stack 5
	.limit locals 4
	ldc 33
	istore 1
	ldc 344
	istore 2
	ldc 4
	istore 3
	ldc 5
	istore 4
	ldc 20
	istore 5
	ldc 2
	istore 6
	ldc 4
	istore 7
	ldc 0
	istore 8
	aload "STRING"
	astore 9
	ldc 2
	istore 10
	ldc 0
	ldc 2
	ldc 0
	ldc 1
	ldc 2
	imul
	ldc 0
	if_icmpeq A1
	ldc 12
	ldc 2
	iadd
	ldc 4
	ldc 2
	isub
	istore 1
	ldc 8
	ldc 4
	idiv
	istore 2
	ldc 2
	ldc 3
	imul
	istore 3
	ldc 2
	ldc 8
	ipow
	istore 4
.end method
