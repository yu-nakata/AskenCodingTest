//
//  Protein.swift
//

/// たんぱく質の栄養素を表すクラス
class Protein: Nutrient {
    /// プロテインのカロリーは1gあたり4kcalとする
    private let protainCalories = 4.0
    private let _grams: Double
    
    /// 摂取量(g)
    var grams: Double {
        // 小数第一位 (小数第二位を四捨五入)
        return ((_grams * 10).rounded()) / 10
    }
    
    /// カロリー(kcal)
    var calories: Int {
        // 整数 (小数第一位を四捨五入)
        return Int((grams * protainCalories).rounded())
    }
    
    required init(grams: Double) {
        self._grams = grams
    }
}
