//1. can write a piece of code that displays a string.
//Think of all the ways you’ll want to display messages in future programs you create.

#include <iostream>
#include <string>

int main1() {
    std::string message = "Hello, world!";
    std::cout << message << std::endl;
    return 0;
}

int main2() {
    int num1, num2;

    // Input the first integer
    std::cout << "Enter the first integer: ";
    std::cin >> num1;

    // Input the second integer
    std::cout << "Enter the second integer: ";
    std::cin >> num2;

    // Calculate the sum
    int sum = num1 + num2;

    // Output the result
    std::cout << "The sum of " << num1 << " and " << num2 << " is: " << sum << std::endl;

    return 0;
}
