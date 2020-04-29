// https://www.hackerrank.com/challenges/30-operators/problem

#include <iostream>
#include <iomanip>
#include <string>

using namespace std;

int main(){
    double mealCost;
    double mealTipPercent;
    double mealTaxPercent;
    
    double mealTip;
    double mealTax;
    
    cin >> mealCost;    
    cin >> mealTipPercent;
    cin >> mealTaxPercent;
    
    mealTip = mealCost * (mealTipPercent / 100);
    mealTax = mealCost * (mealTaxPercent / 100);
    
    cout << fixed << setprecision(0) << "The total meal cost is "<< mealCost + mealTip + mealTax <<" dollars." << endl;
    
}
