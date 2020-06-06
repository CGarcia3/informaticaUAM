;**************************************************************************
; 					SBM 
; Pareja numero: 5
; Alba Ramos Pedroviejo
; Arturo Morcillo Penares
;**************************************************************************

1. Instrucciones
	El programa permite calcular determinantes de matrices 3x3. Al arrancarlo, aparece un men� que permite seleccionar la opci�n de calcular el determinante por 
	defecto de nuestro programa o introducir tus propios valores en la matriz. Si se escoge la �ltima opci�n, se mostrar�n unas instrucciones por pantalla y, a continuaci�n,
	se solicitar�n los n�meros por filas. Los n�meros permitidos van desde -16 hasta 15, ambos incluidos. 
	Adem�s, el men� principal detecta cuando has tecleado una opci�n distinta a las que se esperan, y termina la ejecuci�n del programa. Sin embargo, no est� controlado
	cuando se introducen n�meros fuera del rango especificado, ya que se nos especifica que las entradas ser�n de 8 bits. 

2. Decisiones de dise�o
	El c�digo del determinante por defecto no presenta dificultades en su comprensi�n, simplemente son llamadas a funciones.

	El c�digo del determinante personalizado es m�s complejo. Este c�digo est� estructurado de la siguiente forma:
	- Mostrar un mensaje de la fila y columna solicitada
	- Comprobar si se han introducido 1, 2 o 3 caracteres, para guardar su ASCII en memoria para mostrarlo en la matriz despu�s
	- Comprobar si el n�mero es negativo (de 1 o 2 cifras) o no, y obtener su valor decimal a partir del ASCII. Esto se guarda en BX
	- Almacenar en la matriz de la memoria este resultado, para calcular el determinante luego.

	Esto se repite para cada una de las 9 posiciones de la matriz. Quer�amos hacerlo con un bucle, pero no sab�amos como estructurarlo para almacenar cada fila.

	- Tras tener la matriz de decimales, se calcula el determinante
	- Comprobamos si es positivo o negativo, para mostrar su ASCII en el resultado
	- Mostrar la matriz y el resultado del determinante

3. Funciones

	Se explican algunas funciones utilizadas: 
	- GUARDAR_RESULTADO: guarda en BX el resultado del determinante. Este est� en decimal, y queremos guardarlo en ASCII para mostrarlo por pantalla. Como puede haber 
		hasta 4 cifras (adem�s del signo '-' en su caso), tenemos que almacenar unidades de millar (1000), centenas (100), decenas (10) y unidades. Para ello, dividimos 
		entre DX (que contiene cada valor mencionado previamente entre par�ntesis). El cociente de la divisi�n est� en AX (le sumaremos 48, que es el ASCII del 0) y el resto 
		en DX (para la siguiente cifra usaremos este resto y repetiremos la operaci�n).
	- GUARDAR_RESULTADO_NEGATIVO: realiza la misma funci�n que la anterior, pero poniendo un '-' (cuyo ASCII es 45) delante del n�mero, el cual hay que
		pasar a complemento a 2 para operar.
	- TECLADO1 y TECLADO2: almacenan el valor ASCII tecleado por el usuario en la matriz ASCII de memoria, la que se mostrar� al final
	- CONVERTIRNUMERO: convierte un n�mero ASCII positivo (los negativos los tratan las dos �ltimas funciones, similares a esta) a decimal haciendo 
		el procedimiento inverso de GUARDAR_RESULTADO: en vez de dividir entre 100, 10, etc, multiplica, y en vez de sumar 48, lo resta. 
