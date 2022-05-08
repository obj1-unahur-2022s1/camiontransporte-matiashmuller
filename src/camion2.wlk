import cosas2.*

object camion {
	var cosasCargadas = []
	
	method cargar(cosa) {
		cosasCargadas.add(cosa)
		cosa.sufrirCarga()
	}
	method cargarVarios(cosas) { cosasCargadas.addAll(cosas)}
	method descargar(cosa) { cosasCargadas.remove(cosa) }
	method todoPesoPar() = cosasCargadas.all({ c => c.peso().even() })
	method hayAlgunoQuePesa(peso) = cosasCargadas.any({ c => c.peso() == peso })
	method elDeNivel(nivel) = cosasCargadas.find({ c => c.nivelDePeligrosidad() == nivel })
	method pesoTotal() = self.pesoTara() + self.pesoCarga()
	method pesoTara() = 1000
	method pesoCarga() = cosasCargadas.sum({ c => c.peso() })
	method excedidoDePeso() = self.pesoTotal() > self.pesoMaximo()
	method pesoMaximo() = 2500
	method objetosQueSuperanPeligrosidad(nivel) = cosasCargadas.filter({ c => c.nivelDePeligrosidad() > nivel })
	method objetosMasPeligrososQue(cosa) = cosasCargadas.filter({ c => c.nivelDePeligrosidad() > cosa.nivelDePeligrosidad() })
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = 
		!self.excedidoDePeso() &&
		 self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	method tieneAlgoQuePesaEntre(min, max) = cosasCargadas.any({ c => c.peso().between(min, max) })
	method cosaMasPesada() = cosasCargadas.max({ c => c.peso() })
	method pesos() = cosasCargadas.map({ c => c.peso() })
	
	method totalBultos() = cosasCargadas.sum({ c => c.cantidadComoBulto() })
}
