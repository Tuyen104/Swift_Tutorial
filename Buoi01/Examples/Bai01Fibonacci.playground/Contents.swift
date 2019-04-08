import UIKit
class Buoi01BaiTap{
    func findFibonacci(num : Int) -> Int{
        var numTemp = num
        var a = 1, b = 0, temp = 0;
        while numTemp>2
        {
            temp = a
            a = a + b
            b = temp
            numTemp -= 1
        }
        return a;
    }
    
    func sortArray(arrays : [String]) -> [String]{
        var ar = arrays
        return ar.sorted()
    }
    
    func findFirstChar(arrays : [String], key : String) -> [String?]{
        var arrSort = arrays.sorted()
        var newArr : [String?] = []
        var firstIn = 0
        var lastIn = arrSort.count - 1
        var count = 0
        while firstIn <= lastIn {
            var midIndex = (firstIn + (lastIn + 1))/2
            print(midIndex)
            if arrSort[midIndex].lowercased().hasPrefix(key) {
                newArr.append(arrSort[midIndex])
                lastIn = midIndex - 1
                count = count + 1
            }else if key > arrSort[midIndex].lowercased(){
                firstIn = midIndex + 1
            }else {
                lastIn = midIndex - 1
            }
        }
        print(count)
        return newArr
    }
    
}
var ex1 = Buoi01BaiTap()
ex1.findFibonacci(num: 8)
ex1.sortArray(arrays: ["ABC", "YGH", "BCG", "MNH", "BCD", "Y"])
ex1.findFirstChar(arrays: ["ABC", "YGH", "YCG", "MNH", "BCD"], key: "Y")

