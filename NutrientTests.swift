import Foundation
import XCTest

/// 栄養素計算クラスのテスト
class NutrientTests: XCTestCase {
    
    // MARK: - Proteinクラスのテスト
    
    /// テスト観点: Proteinクラスが正しくカロリー計算できるか
    func testProteinCalories() {
        // 基本的なケース
        let protein1 = Protein(grams: 10.0)
        XCTAssertEqual(protein1.calories, 40, "たんぱく質10gは40kcalになるべき")
        
        // 小数点以下のケース（小数第一位で四捨五入）
        let protein2 = Protein(grams: 5.25)
        XCTAssertEqual(protein2.grams, 5.3, "グラム数は小数第一位で四捨五入されるべき")
        XCTAssertEqual(protein2.calories, 21, "5.3g * 4 = 21.2 → 21kcalになるべき")
        
        // 境界値のケース
        let protein3 = Protein(grams: 0.0)
        XCTAssertEqual(protein3.calories, 0, "0gは0kcalになるべき")
    }
    
    // MARK: - Fatクラスのテスト
    
    /// テスト観点: Fatクラスが正しくカロリー計算できるか
    func testFatCalories() {
        // 基本的なケース
        let fat1 = Fat(grams: 10.0)
        XCTAssertEqual(fat1.calories, 90, "脂質10gは90kcalになるべき")
        
        // 小数点以下のケース（小数第一位で四捨五入）
        let fat2 = Fat(grams: 5.24)
        XCTAssertEqual(fat2.grams, 5.2, "グラム数は小数第一位で四捨五入されるべき")
        XCTAssertEqual(fat2.calories, 47, "5.2g * 9 = 46.8 → 47kcalになるべき")
        
        // 境界値のケース
        let fat3 = Fat(grams: 0.0)
        XCTAssertEqual(fat3.calories, 0, "0gは0kcalになるべき")
    }
    
    // MARK: - Carbohydrateクラスのテスト
    
    /// テスト観点: Carbohydrateクラスが正しくカロリー計算できるか
    func testCarbohydrateCalories() {
        // 基本的なケース
        let carb1 = Carbohydrate(grams: 10.0)
        XCTAssertEqual(carb1.calories, 40, "炭水化物10gは40kcalになるべき")
        
        // 小数点以下のケース（小数第一位で四捨五入）
        let carb2 = Carbohydrate(grams: 5.26)
        XCTAssertEqual(carb2.grams, 5.3, "グラム数は小数第一位で四捨五入されるべき")
        XCTAssertEqual(carb2.calories, 21, "5.3g * 4 = 21.2 → 21kcalになるべき")
        
        // 境界値のケース
        let carb3 = Carbohydrate(grams: 0.0)
        XCTAssertEqual(carb3.calories, 0, "0gは0kcalになるべき")
    }
    
    // MARK: - 納豆ご飯の計算テスト

    /// テスト観点: 納豆ご飯の総カロリー計算が正しいか
    func testNattoRiceCalculation() {
        // 白米の栄養素（P:2.5g, F:0.3g, C:37.1g）
        let riceProtein = Protein(grams: 2.5)
        let riceFat = Fat(grams: 0.3)
        let riceCarb = Carbohydrate(grams: 37.1)
        
        // 納豆の栄養素（P:16.5g, F:10.0g, C:12.1g）
        let nattoProtein = Protein(grams: 16.5)
        let nattoFat = Fat(grams: 10.0)
        let nattoCarb = Carbohydrate(grams: 12.1)
        
        // 白米のカロリー確認
        let riceProteinCalories = riceProtein.calories  // 2.5g → 10kcal
        let riceFatCalories = riceFat.calories         // 0.3g → 3kcal
        let riceCarbCalories = riceCarb.calories       // 37.1g → 148kcal
        let riceCalories = riceProteinCalories + riceFatCalories + riceCarbCalories
        
        // 納豆のカロリー確認
        let nattoProteinCalories = nattoProtein.calories  // 16.5g → 66kcal
        let nattoFatCalories = nattoFat.calories         // 10.0g → 90kcal
        let nattoCarbCalories = nattoCarb.calories       // 12.1g → 48kcal
        let nattoCalories = nattoProteinCalories + nattoFatCalories + nattoCarbCalories
        
        // 個別の栄養素カロリー確認
        XCTAssertEqual(riceProteinCalories, 10, "白米のたんぱく質: 2.5g → 10kcal")
        XCTAssertEqual(riceFatCalories, 3, "白米の脂質: 0.3g → 3kcal")
        XCTAssertEqual(riceCarbCalories, 148, "白米の炭水化物: 37.1g → 148kcal")
        
        XCTAssertEqual(nattoProteinCalories, 66, "納豆のたんぱく質: 16.5g → 66kcal")
        XCTAssertEqual(nattoFatCalories, 90, "納豆の脂質: 10.0g → 90kcal")
        XCTAssertEqual(nattoCarbCalories, 48, "納豆の炭水化物: 12.1g → 48kcal")
        
        // 食品ごとのカロリー確認
        XCTAssertEqual(riceCalories, 161, "白米の総カロリー: 10 + 3 + 148 = 161kcal")
        XCTAssertEqual(nattoCalories, 204, "納豆の総カロリー: 66 + 90 + 48 = 204kcal")
        
        // 納豆ご飯の総カロリー確認
        let totalCalories = riceCalories + nattoCalories
        XCTAssertEqual(totalCalories, 365, "納豆ご飯の総カロリー: 161 + 204 = 365kcal")
        
        // NattoRiceCalculatorクラスの結果と一致するかの確認
        XCTAssertEqual(NattoRiceCalculator.calcTotalCalories(), 365, "NattoRiceCalculator.calcTotalCaloriesの結果が正しいか")
    }
    
    // MARK: - グラムの四捨五入テスト
    
    /// テスト観点: 栄養素グラム数の四捨五入が正しく行われるか
    func testGramsRounding() {
        // 切り捨てケース
        let protein1 = Protein(grams: 5.14)
        XCTAssertEqual(protein1.grams, 5.1, "5.14は5.1に四捨五入されるべき")
        
        // 切り上げケース
        let fat1 = Fat(grams: 5.15)
        XCTAssertEqual(fat1.grams, 5.2, "5.15は5.2に四捨五入されるべき")
        
        // 境界値
        let carb1 = Carbohydrate(grams: 5.05)
        XCTAssertEqual(carb1.grams, 5.1, "5.05は5.1に四捨五入されるべき")
        
        let carb2 = Carbohydrate(grams: 5.04)
        XCTAssertEqual(carb2.grams, 5.0, "5.04は5.0に四捨五入されるべき")
    }
    
    // MARK: - カロリー計算の四捨五入テスト
    
    /// テスト観点: カロリー計算の四捨五入が正しく行われるか
    func testCalorieRounding() {
        // 切り捨てケース
        let protein = Protein(grams: 10.1)
        XCTAssertEqual(protein.calories, 40, "10.1g * 4 = 40.4 → 40kcal")
        
        // 切り上げケース
        let fat = Fat(grams: 5.6)
        XCTAssertEqual(fat.calories, 50, "5.6g * 9 = 50.4 → 50kcal")
        
        // 境界値
        let carb1 = Carbohydrate(grams: 10.125)
        XCTAssertEqual(carb1.grams, 10.1, "グラムは10.1に四捨五入")
        XCTAssertEqual(carb1.calories, 40, "10.1g * 4 = 40.4 → 40kcal")
        
        let carb2 = Carbohydrate(grams: 10.25)
        XCTAssertEqual(carb2.grams, 10.3, "グラムは10.3に四捨五入")
        XCTAssertEqual(carb2.calories, 41, "10.3g * 4 = 41.2 → 41kcal")
    }
}

// テストを実行する関数
func runTests() {
    let tests = NutrientTests()
    print("### テスト開始")
    
    // Proteinクラスのテスト
    print("Proteinクラスのテスト:")
    tests.testProteinCalories()
    print("OK")
    
    // Fatクラスのテスト
    print("Fatクラスのテスト:")
    tests.testFatCalories()
    print("OK")
    
    // Carbohydrateクラスのテスト
    print("Carbohydrateクラスのテスト:")
    tests.testCarbohydrateCalories()
    print("OK")
    
    // 納豆ご飯の計算テスト
    print("納豆ご飯の計算テスト:")
    tests.testNattoRiceCalculation()
    print("OK")
    
    // グラムの四捨五入テスト
    print("グラムの四捨五入テスト:")
    tests.testGramsRounding()
    print("OK")
    
    // カロリー計算の四捨五入テスト
    print("カロリー計算の四捨五入テスト:")
    tests.testCalorieRounding()
    print("OK")
    
    print("### テスト終了")
}
