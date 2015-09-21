# Swift 2.0 Option Set(选项集合)

- 位掩码
	- 在写一个角色扮演的游戏（比如说传奇）游戏的角色可能拥有各种装备，比如盔甲，剑以及头盔等等。定义一个整数并使用它的比特位来进行表示。由于每个比特位只能存储 0 或者 1，可以使用它来对每个装备进行表示，这就是所谓的位掩码。
- 位掩码的操作:
	```Swift
	struct Inventory: OptionSetType {
    let rawValue: Int
    static let Sword = Inventory(rawValue: 1)
    static let Armor = Inventory(rawValue: 1 << 1)
    static let Helmet = Inventory(rawValue: 1 << 2)
	}

	var inventory: Inventory = [.Sword, .Shield]
	if inventory.contains(.Shield) {
    	print("屠龙在手，天下我有")
	}	
	```
