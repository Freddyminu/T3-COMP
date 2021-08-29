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
<<<<<<< HEAD
	ldc "digite dois valores"
	astore 0
	ldc ""
	astore 1
=======
	ldc 0
	istore 0
	ldc 0
	istore 1
	ldc 40
	istore 2
>>>>>>> ba1026a544ef0d096e8d383cc021a61e7019330c
	new java/util/Scanner
	dup
	getstatic java/lang/System/in Ljava/io/InputStream;
	invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
<<<<<<< HEAD
	invokevirtual java/util/Scanner/nextLine()Ljava/lang/String;
	astore 1
	getstatic java/lang/System/out Ljava/io/PrintStream;
	ldc "fala"
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	getstatic java/lang/System/out Ljava/io/PrintStream;
	aload 1
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
=======
	invokevirtual java/util/Scanner/nextInt()I
	istore 1
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 1
	ldc 2
	imul
	invokevirtual java/io/PrintStream/println(I)V
	iload 1
	ldc 20
	if_icmplt A1
	goto A2
A1:
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 1
	invokevirtual java/io/PrintStream/println(I)V
	iload 1
	ldc 15
	if_icmpgt A1
	goto A2
A1:
	iload 1
	ldc 5
	iadd
	istore 1
A2:
A2:
	getstatic java/lang/System/out Ljava/io/PrintStream;
	iload 1
	invokevirtual java/io/PrintStream/println(I)V
>>>>>>> ba1026a544ef0d096e8d383cc021a61e7019330c
return
.end method
