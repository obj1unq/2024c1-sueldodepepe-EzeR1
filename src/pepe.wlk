object pepe {

	var categoria = cadete
	var bonoResultado = resultadoNulo
	var bonoPresentismo = presentismoNulo
	var faltas = 0

	method faltas(_faltas) {
		faltas = _faltas
	}

	method faltas() {
		return faltas
	}

	method categoria(_categoria) {
		categoria = _categoria
	}

	method bonoResultado(_bonoResultado) {
		bonoResultado = _bonoResultado
	}

	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}

	method sueldo() {
		return self.neto() + self.resultado() + self.presentismo()
	}

	method neto() {
		return categoria.neto()
	}

	method resultado() {
		return bonoResultado.valor(self)
	}

	method presentismo() {
		return bonoPresentismo.valor(self)
	}

}

//CATEGORIAS
object gerente {

	method neto() {
		return 15000
	}

}

object cadete {

	method neto() {
		return 20000
	}

}

//BONOS DE RESULTADO
object fijo {

	method valor(empleado) {
		return 800
	}

}

object resultadoNulo {

	method valor(empleado) {
		return 0
	}

}

object porcentual {

	method valor(empleado) {
		return empleado.neto() * 0.10
	}

}

//Bono Presentismo
object presentismoNulo {

	method valor(empleado) {
		return 0
	}

}

object demagogico {

	method valor(empleado) {
		return if (empleado.neto() < 18000) {
			500
		} else {
			300
		}
	}

}

object normal {

	method valor(empleado) {
		return if (empleado.faltas() == 0) {
			2000
		} else if (empleado.faltas() == 1) {
			1000
		} else {
			0
		}
	// return (2000 - empleado.faltas() * 1000).max(0)
	}

}

object ajuste {

	method valor(empleado) {
		return if (empleado.faltas() == 0) {
			100
		} else {
			0
		}
	}

}

// -----------BONUS----------------
// 1)
object sofia {

	var categoria = cadete
	var bonoResultado = resultadoNulo

	method categoria(_categoria) {
		categoria = _categoria
	}

	method bonoResultado(_bonoResultado) {
		bonoResultado = _bonoResultado
	}

	method sueldo() {
		return self.neto() + self.resultado()
	}

	method neto() {
		return categoria.neto() * 1.3
	}

	method resultado() {
		return bonoResultado.valor(self)
	}

}

// 2) 
object vendedor {

	var neto = 16000

	method neto() {
		return neto
	}

	method activarAumentoPorMuchasVentas() {
		if (neto == 16000) {
			neto *= 1.25
		}
	}

	method desactivarAumentoPorMuchasVentas() {
		if (neto == 20000) {
			neto /= 1.25
		}
	}

}

object medioTiempo {
	
	var neto = 0
	
	method categoriaBase(categoria) {
		neto = (categoria.neto() / 2)
	}
	
	method neto() {
		return neto
	}
}

// 3) 
object roque {

	var bonoResultado = resultadoNulo

	method bonoResultado(_bonoResultado) {
		bonoResultado = _bonoResultado
	}

	method sueldo() {
		return self.neto() + self.resultado() + 9000
	}

	method neto() {
		return 28000
	}

	method resultado() {
		return bonoResultado.valor(self)
	}

}

object ernesto {

	var bonoPresentismo = presentismoNulo
	var companiero = pepe
	const faltas = 0
	
	method faltas() {
		return faltas
	}
	
	method companiero(_companiero) {
		companiero = _companiero
	}

	method neto() {
		return companiero.neto()
	}

	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}

	method presentismo() {
		return bonoPresentismo.valor(self)
	}

	method sueldo() {
		return self.neto() + self.presentismo()
	}

}

