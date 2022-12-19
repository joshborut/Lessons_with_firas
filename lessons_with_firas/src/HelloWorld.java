import java.util.Scanner;

public class HelloWorld {

    public static Scanner scanner;
    public static int number;

    public static void main(String[] args) {
        // i += 1 is the same is i++ which is the same as i = i + 1
        // for (int i = 0; i < args.length; i++) {
        //     System.out.println(args[i]);
        // }

        for (String s: args) {
            System.out.println(s);
        }
        scanner = new Scanner(System.in);
        System.out.println("Enter a number: ");
        number = scanner.nextInt();
        printData();

//        new Greeter("keyboard").caller();
        Greeter greeter = new Greeter("keyboard");
        System.out.println(greeter.greeting());
        greeter.caller();
        greeter.msgPrinter();

        Greeter greeter2 = new Greeter("monitor");
        greeter2.msgPrinter();
    }

    public static void printData() {
        System.out.println("You entered: " + number);
    }

    public static void printPassedData(String arg) {
        System.out.println("You entered: " + arg);
    }
}
