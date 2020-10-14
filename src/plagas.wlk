import elementos.*

class Plaga {
	var property poblacion = 0
	
	method transmiteEnfermedades() { return self.poblacion() >= 10 }
	method ataquePlaga() { poblacion *= 1.1}
	method ataqueElemento(elemento) { elemento.ataquePlaga(self) }
}

class Cucarachas inherits Plaga {
	var property pesoPromedioBicho = 0
	
	method nivelDeDanio() { return self.poblacion() / 2 }
	override method transmiteEnfermedades() { 
		return self.poblacion() >= 10 && self.pesoPromedioBicho() >= 10
	}
	override method ataquePlaga() { poblacion *= 1.1 ; pesoPromedioBicho += 2}
}

class Mosquitos inherits Plaga {
	
	method nivelDeDanio() { return self.poblacion() }
	override method transmiteEnfermedades() {
		return self.poblacion() >= 10 && self.poblacion() % 3 == 0
	}
}

class Pulgas inherits Plaga {
	method nivelDeDanio() { return self.poblacion() * 2 }
}

class Garrapatas inherits Pulgas {
	override method ataquePlaga() { poblacion *= 1.2}
}