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
	ldc 0
	istore 3
	astore 4
	getstatic java/lang/System/out Ljava/io/PrintStream;
	aload 4
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	new java/util/Scanner
	dup
	getstatic java/lang/System/in Ljava/io/InputStream;
	invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
	invokevirtual java/util/Scanner/nextInt()I
	istore 0
	new java/util/Scanner
	dup
	getstatic java/lang/System/in Ljava/io/InputStream;
	invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
	invokevirtual java/util/Scanner/nextInt()I
	istore 1
	iload 0
	iload 1
	iadd
	istore 3
	iload 3
	ldc 0
	if_icmpgt A1
	goto A2
A1:
	iload 0
	iload 1
	iadd
	istore 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 2
	invokevirtual java/io/PrintStream/println(I)V
	iload 0
	iload 1
	isub
	istore 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 2
	invokevirtual java/io/PrintStream/println(I)V
	iload 0
	iload 1
	imul
	istore 2
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 2
	invokevirtual java/io/PrintStream/println(I)V
A2:
return
.end method
