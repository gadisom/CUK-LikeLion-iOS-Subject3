
import Foundation
struct Person {

    var money : Int
    var name : String

    // 구매가 가능한지 여부
    mutating func buy (itemPrice : Int) -> Bool
    {
        if money >= itemPrice
        {
            money -= itemPrice
            print("""
                    *입출금 내역*
                    출금 : \(itemPrice)
                    \(name)님의 잔액은 \(money)원 입니다.
                    """)
            return true
        }
        
        else {
            print("잔액이 \(itemPrice - money)원 부족합니다.\n")
            return false
        }
    }

}

struct CoffeeShop {

    var sales : Int
    var barista : Person?
    var menu : [Coffee : Int]?
    var pickUpTable : [Coffee] = []

    mutating func order (coffee : Coffee ,customer : inout Person)  {
        
        guard barista != nil else {
            print("바리스타가 없습니다. \n")
            return
        }
        
        guard let itemPrice = menu?[coffee] else {
            print("메뉴에 없는 것입니다.\n")
            return
        }
        
        guard customer.buy(itemPrice: itemPrice) else {
            return
        }
        
        sales += itemPrice
        pickUpTable.insert(coffee, at:pickUpTable.endIndex)
        
        // 메뉴를 제공
        provideItem(coffee: coffee, customer: &customer)
        
    }
    mutating func provideItem (coffee: Coffee, customer : inout Person)
    {
        let orderNumber = pickUpTable.count
        let customer_name = customer.name
        let ordered_menu = pickUpTable[pickUpTable.endIndex-1]
        
        print("""
            
            대기번호 :\(orderNumber)
            \(customer_name)님의
            \(ordered_menu) 준비되었습니다.
            픽업대에서 가져가주세요
            
            """)
    }

}

enum Coffee {
    
    case americano ,latte ,tea ,capuccino
}


var misterLee = Person(money: 10000 ,name :"misterLee")
var missKim = Person(money: 6000,name :"missKim")
var mutsabucks = CoffeeShop(sales: 0, barista: misterLee)
var starbucks = CoffeeShop(sales: 0)

mutsabucks.menu = [.americano:2000,.latte:3000,.tea:4000,.capuccino:3500]
starbucks.menu = [.americano:2000]

mutsabucks.order(coffee: .americano, customer: &missKim)
mutsabucks.order(coffee: .latte, customer: &missKim)
mutsabucks.order(coffee: .tea, customer: &missKim)
starbucks.order(coffee: .americano, customer: &misterLee)


