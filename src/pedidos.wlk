class Pedido {
	const property distancia
	var property tiempoMaximo
	const property cantPasajeros
	const property coloresIncompatibles = #{} // new list (genera nueva lista) new set (genera nuevo conjunto)
	
	method velocidadRequerida() = distancia / tiempoMaximo
	
	method puedeSatisfacer(unRodado) = (unRodado.velocidad() >= self.velocidadRequerida() + 10) 
									   and unRodado.capacidad() >= cantPasajeros 
									   and not self.colorIncompatible(unRodado.color())
									   
	method acelerar() { tiempoMaximo = 0.max(tiempoMaximo - 1) }
	method relajar() { tiempoMaximo = tiempoMaximo + 1 }
	method colorIncompatible(unColor) = coloresIncompatibles.contains(unColor) 												       
}