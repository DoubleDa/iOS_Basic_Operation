//
//  main.cpp
//  test
//
//  Created by 游义男 on 15/7/24.
//  Copyright © 2015年 游义男. All rights reserved.
//

#include <iostream>

void swap(int a,int b){
    std::cout <<"shuchushuzi";
    int temp;
    temp  = a;
    a = b;
    b = temp;
    
}
int main(int argc, const char * argv[]) {
    int a = 3;
    int b = 5;
    swap(a, b);
    
    // insert code here...
    std::cout << a << b;
    return 0;
}
