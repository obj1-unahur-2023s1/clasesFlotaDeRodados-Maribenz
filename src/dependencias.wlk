import pedido.*

class Dependencia {
	const flota = []
	var property empleados
	const listaPedidos = []
	
	method agregarAFlota(unRodado) { flota.add(unRodado) }
	method quitarDeAFlota(unRodado) { flota.remove(unRodado) }
	method pesoTotalFlota() = flota.sum({ r => r.peso() })
	method estaBienEquipado() = flota.size() >= 3 and flota.all({r => r.velocidad() >= 100})
	method capacidadTotalEnColor(color) = flota.filter({r => r.color() == color}).sum({r => r.capacidad()})	
	method colorDelRodadoMasRapido() = flota.max({r => r.velocidad()}).color()
	method capacidadFlota() = flota.sum({ r => r.capacidad()})
	method capacidadFaltante() = self.capacidadFlota() - self.empleados()
	method esGrande() = flota.size() >= 5 and self.empleados() >= 40
	
	method agregarPedido(pedido) { listaPedidos.add(pedido) }
	method eliminarPedido(pedido) { listaPedidos.remove(pedido) }
	method totalPasajerosEnPedidos() = listaPedidos.sum({p => p.cantPasajeros()})
	
	method hayAlgunRodadoQueSatisfaceUnPedido(unPedido) {
		flota.any({r => unPedido.puedeSatisfacer(r)})
	}
	
	
	// A partir de acá comparar con lo que pasen por Discord.
	method pedidosQueNoPuedenSerSatisfechos() = listaPedidos.filter({p => not self.hayAlgunRodadoQueSatisfaceUnPedido(p)})
	
	method todosPedidosTineneColorIncompatible(unColor) = listaPedidos.all({p => p.colorIncompatible(unColor)})
	// method relajarTodosLosPedidos() = listaDePedidos.forEach({p => p.relajar()})
	// {}
	
	method hayAlgunRodadoQuePoseeUnColorIncompatible() 
}