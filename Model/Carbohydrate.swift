//
//  File.swift
//

/// 炭水化物の栄養素を表すクラス
class Carbohydrate: Nutrient {
    /// 炭水化物のカロリーは1gあたり4kcalとする
    private let fatCalories = 4.0
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
