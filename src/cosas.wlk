/* Algunas aclaraciones:
 * Si bien se que, según lo que pide el enunciado, para varios de estos objetos
 * no es necesario un "property" en la variable, ya que o no uso el setter o
 * no uso el getter, terminé implementándolo porque necesito dichos getter y setters
 * en el testeo de "cosas2". Me pareció más prolijo que ambos archivos (cosas y cosas2)
 * queden igual y se diferencien solo en los métodos adicionales cantidadComoBulto() y 
 * sufrirCarga().
 * Trato de usar property lo más criteriosamente posible.
 */

object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
}

object bumblebee {
	var property estaComoAuto
	
	method peso() = 800
	method nivelDePeligrosidad() = if(estaComoAuto) {15} else {30}
}

object paqueteLadrillos{
	var property cantidadLadrillos
	
	method peso() = cantidadLadrillos *2
	method nivelDePeligrosidad() = 2
}


object arena {
	var property peso
	
	method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea {
	var property estaCargada

	method peso() = if(estaCargada) {300} else {200}
	method nivelDePeligrosidad() = if(estaCargada) {100} else {0}
}

object contenedor {
	var cosasContenidas = []
	
	method meterCosas(cosas) = cosasContenidas.addAll(cosas)
	method vaciar() = cosasContenidas.clear()
	method peso() = self.pesoCosasContenidas() + 100
	method pesoCosasContenidas() = cosasContenidas.sum({ c => c.peso() })
	method nivelDePeligrosidad() = if(cosasContenidas.isEmpty()) {0}
								   else {self.objetoMasPeligrosoContenido().nivelDePeligrosidad()}
	method objetoMasPeligrosoContenido() = cosasContenidas.max({ c => c.nivelDePeligrosidad() })
}

object residuosRadioactivos {
	var property peso
	
	method nivelDePeligrosidad() = 200
}

object embalajeSeguridad {
	var cosaEnvuelta
	
	method cosaEnvuelta(cosa) { cosaEnvuelta = cosa}
	method peso() = cosaEnvuelta.peso()
	method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad() *0.5
}




