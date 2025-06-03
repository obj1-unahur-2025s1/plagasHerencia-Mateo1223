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
        produccion = (produccion - 10).max(0)
      }
      produccion = (produccion - plaga.daño() * 0.10).max(0)
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
        nivelSalud = (nivelSalud - plaga.daño()).max(0)
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

