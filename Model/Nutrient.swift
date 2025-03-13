//
//  Nutrient.swift
//

/// 栄養素の基本プロトコル
protocol Nutrient {
    /// 各栄養素の量
    var grams: Double { get }
    
    /// カロリー
    var calories: Int { get }
    
    init(grams: Double)
}
