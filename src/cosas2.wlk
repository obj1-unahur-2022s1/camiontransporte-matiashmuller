object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method cantidadComoBulto() = 1
	method sufrirCarga() {}
}

object bumblebee {
	var property estaComoAuto
	
	method peso() = 800
	method nivelDePeligrosidad() = if(estaComoAuto) {15} else {30}
	method cantidadComoBulto() = 2
	method sufrirCarga() { estaComoAuto = false }
}

object paqueteLadrillos{
	var property cantidadLadrillos
	
	method peso() = cantidadLadrillos *2
	method nivelDePeligrosidad() = 2
	method cantidadComoBulto() = if(cantidadLadrillos <= 100) {1}
								 else if(cantidadLadrillos <= 300) {2}
								 else {3}
	method sufrirCarga() { cantidadLadrillos += 12 }
}


object arena {
	var property peso
	
	method nivelDePeligrosidad() = 1
	method cantidadComoBulto() = 1
	method sufrirCarga() { peso += 20 }
}

object bateriaAntiaerea {
	var property estaCargada

	method peso() = if(estaCargada) {300} else {200}
	method nivelDePeligrosidad() = if(estaCargada) {100} else {0}
	method cantidadComoBulto() = if(estaCargada) {2} else {1}
	method sufrirCarga() { self.estaCargada(true) }
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
	method cantidadComoBulto() = cosasContenidas.sum({ c => c.cantidadComoBulto() }) +1
	method sufrirCarga() { cosasContenidas.forEach({ c => c.sufrirCarga() }) }
}

object residuosRadioactivos {
	var property peso
	
	method nivelDePeligrosidad() = 200
	method cantidadComoBulto() = 1
	method sufrirCarga() { peso += 15 }
}

object embalajeSeguridad {
	var cosaEnvuelta
	
	method cosaEnvuelta(cosa) { cosaEnvuelta = cosa}
	method peso() = cosaEnvuelta.peso()
	method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad() *0.5
	method cantidadComoBulto() = 2
	method sufrirCarga() {}
}




