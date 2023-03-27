import Foundation
class Person {

    var money : Int
    var name : String

    init (myMoney : Int , name : String)
    {
        self.money = myMoney
        self.name = name
    }

    func buy (price : Int) -> Bool // price가 money보다 작으면 false
    {
        return price <= money
    }

}

class CoffeeShop {

    var sales : Int
    var barista : Person?
    var menu : [Coffee : Int]? // 커피 종류: 가격
    var pickUpTable : [Coffee] = []

    init(barista: Person, sales: Int) {
        self.barista = barista
        self.sales = sales
        
    }
    
    func order (coffee : Coffee ,person : Person)  {

        guard let menuExist = menu?[coffee] else {
            print("메뉴에 없는 것입니다.")
            return
            
        }
        pickUpTable.insert(coffee, at:pickUpTable.endIndex)
        
    }
}

enum Coffee
{
    case americano ,latte ,tea ,capuccino
}


let misterLee = Person(myMoney: 1000 ,name :"misterLee")
let missKim = Person(myMoney: 2000,name :"missKim")
let mutsabucks = CoffeeShop(barista: misterLee, sales: 0)




