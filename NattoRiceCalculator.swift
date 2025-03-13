//
//  NattoRiceCalculator.swift
//

/// 納豆ご飯のカロリー計算を行うクラス
class NattoRiceCalculator {
    /// 納豆ご飯の総カロリーを計算する関数
    /// - Returns: 納豆ご飯の総カロリー (kcal)
    static func calcTotalCalories() -> Int {
        // 白米の栄養素（P:2.5g, F:0.3g, C:37.1g）
        let riceProtein = Protein(grams: 2.5)
        let riceFat = Fat(grams: 0.3)
        let riceCarb = Carbohydrate(grams: 37.1)
        
        // 納豆の栄養素（P:16.5g, F:10.0g, C:12.1g）
        let nattoProtein = Protein(grams: 16.5)
        let nattoFat = Fat(grams: 10.0)
        let nattoCarb = Carbohydrate(grams: 12.1)
        
        // 白米のカロリー計算
        let riceCalories = riceProtein.calories + riceFat.calories + riceCarb.calories
        
        // 納豆のカロリー計算
        let nattoCalories = nattoProtein.calories + nattoFat.calories + nattoCarb.calories
        
        // 納豆ご飯の総カロリー
        return riceCalories + nattoCalories
    }
}
