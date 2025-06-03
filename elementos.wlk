import plagas.*

class Hogar {
  var mugre
  const confort

  method esBueno() = mugre <= confort / 2

  method recibirAtaque(plaga) {
    mugre += plaga.daño()
  }
}

class Huerta{
    var produccion

    method esBueno() = produccion > nivelMinimoProduccion.valor()

    method recbirAtaque(plaga) {
      if (plaga.transmite()){
        produccion -= 10
      }
      produccion -= plaga.daño() * 0.10
    }
}

object nivelMinimoProduccion {
  var property valor = 100
}

class Mascota{
    var nivelSalud

    method esBueno() = nivelSalud > 250

    method recibirAtaque(plaga) {
      if (plaga.transmite()){
        nivelSalud -= plaga.daño()
      }
    }
}

class Barrio{
    const elementos = []

    method esBueno(unElemento) = unElemento.esBueno()
    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()

    method cantElementosBuenos() = elementos.count({e => e.esBueno()})
    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}

