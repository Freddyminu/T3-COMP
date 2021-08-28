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
	ldc 0
	istore 0
	ldc 0
	istore 1
	ldc 0
	istore 2
	iload 2
	ldc 0
	if_icmpeq A1
	goto A2
A1:
	ldc 4
	istore 2
A2:
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 2
	invokevirtual java/io/PrintStream/println(I)V
return
.end method
