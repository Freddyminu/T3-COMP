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
	ldc 5
	istore 1
	ldc 0
	istore 2
	new java/util/Scanner
	dup
	getstatic java/lang/System/in Ljava/io/InputStream;
	invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
	invokevirtual java/util/Scanner/nextInt()I
	istore 2
	iload 2
	ldc 1
	if_icmpeq A1
	goto A2
A1:
	iload 2
	ldc 4
	ipow
	istore 2
A2:
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 2
	ldc 2
	imul
	invokevirtual java/io/PrintStream/println(I)V
return
.end method
