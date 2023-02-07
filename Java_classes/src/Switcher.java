import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Scanner;
import java.time.*;

public class Switcher {

    // final indicates that the variable will not be altered, thus saving memory
    final static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("Enter a word to check if the first letter is a vowel or consonant:");
        final char letter = sc.nextLine().charAt(0);
        if (Character.isLetter(letter))
            // In switch, case is if and default is else
            switch (letter) {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u':
                    System.out.println("switch: " + letter + " is a vowel!");
                    break;
                default:
                    System.out.println("switch: " + letter + " is a consonant!");
            }
        else
            System.out.println("You have entered a number, not a word.");

        System.out.println("Enter your desired number to check if its even or odd: ");
        final String input = sc.nextLine();
        int num = 0;
        boolean isNum = true;
        for (int i = 0; i < input.length(); i++) {
            if (!Character.isDigit(input.charAt(i))) {
                System.out.println("You entered a sequence containing non-digits!");
                isNum = false;
                break;
            }
        }

        // if (Character.isDigit(input.charAt(0))) {
        if (isNum) {
            num = Integer.parseInt(input);
            switch (num % 2) {
                case 0:
                    System.out.println("Input is even!");
                    break;
                case 1:
                    System.out.println("Input is odd!");
                    break;
                default:
                    System.out.println("Input is odd and input % 2 = " + num % 2);
                    break;
            }
        }

        final double remFive = num % 5.0;
        if (remFive == 1.0) {
            System.out.println(input.charAt(0) + " % 5.0 = " + remFive);
        }

        System.out.println("Enter your birth month to find its horoscope: ");
        final String birthMonth = sc.nextLine().toLowerCase();
        final Month currentMonth = LocalDate.now().getMonth();
        final String shortHand = currentMonth.getDisplayName(TextStyle.SHORT, Locale.ENGLISH);
        final String happyBday = "Your birth day is in this month. Happy birthday!";
        final boolean isBirthMonth = birthMonth.equals(currentMonth.toString()) ||
                birthMonth.equals(currentMonth.getValue() + "") ||
                birthMonth.equals(shortHand.toLowerCase());
        switch (birthMonth) {
            case "october":
            case "oct":
            case "10":
                System.out.println("October horoscope is Libra and Scorpio!");
                if (isBirthMonth)
                    System.out.println(happyBday);
                break;
            case "november":
            case "nov":
            case "11":
                System.out.println("November horoscope is Scorpio and Sagittarius!");
                if (isBirthMonth)
                    System.out.println(happyBday);
                break;
            case "december":
            case "dec":
            case "12":
                System.out.println("December horoscope is Sagittarius and Capricorn!");
                if (isBirthMonth)
                    System.out.println(happyBday);
                break;
            default:
                System.out.println("Your birth month is not in the system!");
        }
    }
}
