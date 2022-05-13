/*
 * cosas2: Bien!. Solo detalles sobre inicialización de variables. 
 */

object knightRider {
	/* Bien. */
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method cantidadComoBulto() = 1
	method sufrirCarga() {}
}

object bumblebee {
	/* Bien. Acá había que inicializar la variable booleana estaComoAuto, porque el enunciado 
	 * dice que el objeto tiene 2 estados, convertido en auto o robot. No estaría del todo correcto que 
	 * nazca como null, pero es un detalle. 
	 */
	var property estaComoAuto
	
	method peso() = 800
	method nivelDePeligrosidad() = if(estaComoAuto) {15} else {30}
	method cantidadComoBulto() = 2
	method sufrirCarga() { estaComoAuto = false }
}

object paqueteLadrillos{
	/* Bien. Tal vez convenía inicializar en 0 cantidadLadrillos, ya que se rompería
	 * la ejecución en caso de cargar un paqueteLadrillos vacío (sin ladrillos). No es un
	 * error, solo una sugerencia que haría más robusto el código.
	 */
	var property cantidadLadrillos
	
	method peso() = cantidadLadrillos *2
	method nivelDePeligrosidad() = 2
	method cantidadComoBulto() = if(cantidadLadrillos <= 100) {1}
								 else if(cantidadLadrillos <= 300) {2}
								 else {3}
	method sufrirCarga() { cantidadLadrillos += 12 }
}


object arena {
	/* Bien. Convendría también inicializar la variable peso, ya que si cargás una bolsa
	 * de arena sin arena (podría ser un escenario válido) la ejecución se rompe. 
	 * Igualmente es un detalle.*/
	var property peso
	
	method nivelDePeligrosidad() = 1
	method cantidadComoBulto() = 1
	method sufrirCarga() { peso += 20 }
}

object bateriaAntiaerea {
	/* Bien. Al igual que con bumblebee, se debía inicializar la variable estaCargada
	 * ya que se rompería la ejecución si se intenta cargar sin setearle el valor. Solo por 
	 * como está el enunciado, no es un error en esta instancia pero hay que tenerlo en cuenta
	 * para los próximos.
	*/
	var property estaCargada

	method peso() = if(estaCargada) {300} else {200}
	method nivelDePeligrosidad() = if(estaCargada) {100} else {0}
	method cantidadComoBulto() = if(estaCargada) {2} else {1}
	method sufrirCarga() { self.estaCargada(true) }
}

object contenedor {
	/* Bien.  La lista de cosasContenidas podría ser una constante si siempre va a apuntar
	 * a la misma lista que agregará cosas o la vaciará. Si nunca será apuntada esa referencia
	 * a otra lista, entonces conviene que sea una constante. */
	var cosasContenidas = []
	
	method meterCosas(cosas) = cosasContenidas.addAll(cosas)
	method vaciar() = cosasContenidas.clear()
	method peso() = self.pesoCosasContenidas() + 100
	method pesoCosasContenidas() = cosasContenidas.sum({ c => c.peso() })
	method nivelDePeligrosidad() = if(cosasContenidas.isEmpty()) {0}
								   else {self.objetoMasPeligrosoContenido().nivelDePeligrosidad()}
	method objetoMasPeligrosoContenido() = cosasContenidas.max({ c => c.nivelDePeligrosidad() })
	method cantidadComoBulto() = cosasContenidas.sum({ c => c.cantidadComoBulto() }) +1
	method sufrirCarga() { cosasContenidas.forEach({ c => c.sufrirCarga() }) }
}

object residuosRadioactivos {
	/* Bien. Convendría inicializar la variable peso */
	var property peso
	
	method nivelDePeligrosidad() = 200
	method cantidadComoBulto() = 1
	method sufrirCarga() { peso += 15 }
}

object embalajeSeguridad {
	/* Bien. la variable cosaEnvuelta podría definirse como var property */
	var cosaEnvuelta
	
	method cosaEnvuelta(cosa) { cosaEnvuelta = cosa}
	method peso() = cosaEnvuelta.peso()
	method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad() *0.5
	method cantidadComoBulto() = 2
	method sufrirCarga() {}
}




