import Foundation
class Person {
    var money : Int
    init (myMoney : Int)
    {
        self.money = myMoney
    }
    
    func buyThings (price : Int) -> Int
    {
        return money - price
    }
    
}
class CoffeeShop {
    
    var sales : Int = 0
    var barista : Person?
    var menu : [String : Int]?
    var pickUpTable : [String] = []
    
    init(barista: Person) {
        self.barista = barista
    }
    
    func order (coffee : Coffee) {
        
    }
    
    enum Coffee {
        case americano ,latte ,tea ,capuccino
    }
}

let misterLee = Person(myMoney: 1000)
let missKim = Person(myMoney: 30000)
let mutsabucks = CoffeeShop(barista: misterLee)



