import elementos.*

class Plaga{
    var poblacion

    method transmite() = poblacion >= 10
    method daño() = poblacion

    method atacar(elemento) {
      elemento.recbirAtaque(self)
    }
}

class Cucarachas inherits Plaga{
    var pesoPromedio

    override method daño() = super() * 0.5
    override method transmite() = super() and pesoPromedio >= 10

    override method atacar(elemento) {
      super(elemento)  
      pesoPromedio += 2
    }
}

class Pulgas inherits Plaga{
    override method daño() = super() * 2

    override method atacar(elemento) {
      super(elemento)
      poblacion += poblacion * 0.10
    }
}

class Garrapatas inherits Pulgas{
    override method atacar(elemento) {
      super(elemento)
      poblacion += poblacion * 0.20
    }
}

class Mosquitos inherits Plaga{
    override method transmite() = super() and poblacion % 3 == 0
}