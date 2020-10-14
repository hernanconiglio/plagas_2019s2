import plagas.*

class Hogar {
	var property nivelDeMugre = 0
	var property confort = 0
	
	method esBueno() { return
		self.nivelDeMugre() < self.confort() / 2
	}
	
	method ataquePlaga(plaga) {
		nivelDeMugre += plaga.nivelDeDanio()
		plaga.ataquePlaga()
	}
}

class Huerta {
	var property capacidadDeProduccion = 0
	
	method esBueno() { return capacidadDeProduccion > nivelMP.nivelMinimoProduccion() }
	
	method ataquePlaga(plaga) {
		capacidadDeProduccion -= 0.1 * plaga.nivelDeDanio()
		if (plaga.transmiteEnfermedades()) { 
			capacidadDeProduccion = 0.max(capacidadDeProduccion - 10 )
		}
		plaga.ataquePlaga()
	}
}

object nivelMP {
	var property nivelMinimoProduccion = 0
}

class Mascota {
	var property nivelSalud = 300
	
	method esBueno() { return self.nivelSalud() > 250 }
	
	method ataquePlaga(plaga) {
		if (plaga.transmiteEnfermedades()) { 
			nivelSalud = 0.max(nivelSalud - plaga.nivelDeDanio())
		}
		plaga.ataquePlaga()
	}
}

class Barrio {
	var property elementos = []
	
	method esCopado() { return
		elementos.size() / 2 < elementos.count({ e=>e.esBueno() } )
	}
	
	method agregarElementos(listaElementos) { elementos.addAll(listaElementos) }
	method eliminarElementos(listaElementos) { elementos.removeAll(listaElementos) }
}