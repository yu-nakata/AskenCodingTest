//
//  Fat.swift
//

/// 脂質の栄養素を表すクラス
class Fat: Nutrient {
    /// 脂質のカロリーは1gあたり9kcalとする
    private let fatCalories = 9.0
    private let _grams: Double
    
    var grams: Double {
        // 小数第一位 (小数第二位を四捨五入)
        return ((_grams * 10).rounded()) / 10
    }
    
    var calories: Int {
        // 整数 (小数第一位を四捨五入)
        return Int((grams * fatCalories).rounded())
    }
    
    required init(grams: Double) {
        self._grams = grams
    }
}
