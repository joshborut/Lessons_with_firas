// * gives access to all of util directory

import java.util.*;

public class Mathematics {
    public static void main(String args[]) {
        System.out.println("hi math");
        int num1 = 10;
        int num2 = 20;
        System.out.println(num1 + " " + num2);
        System.out.println(num1 + num2);

        float product = 1.5f * 2.0f;
        System.out.println("The product is equal to: " + product);
        System.out.printf("%.2f", product);

        int dividend = 47, divisor = 4;
        int quotient = dividend / divisor;
        int remainder = dividend % divisor;
        printPassedData("\n" + quotient);
        printPassedData(Integer.toString(quotient));
        printPassedData(String.valueOf(remainder));

        Scanner scanner = new Scanner(System.in);
        printPassedData("Enter a number");
        int input = scanner.nextInt();
        // {} are not necessary for if/else statements containing one line
        if (input % 2 == 0)
            printPassedData(input + " is even");
        else
            printPassedData(input + " is odd");
    }

    public static void printPassedData(String arg) {
        System.out.println(arg);
    }
}
