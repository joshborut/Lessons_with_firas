import java.util.ArrayList;

public class DifferentArrays {
    public static void main(String[] args) {
        char letter = 'a';
        String vowelString = "aeiou";

        // if (vowelString.contains(Character.toString(letter))) {
        //     System.out.println("The letter " + letter + " is a vowel!");
        // } else {
        //     System.out.println("The letter " + letter + " is not a vowel!");
        // }

        //Ternary if statement
        System.out.println((vowelString.contains("" + letter) ? "The letter " + letter + " is vowel!" :
                "The letter " + letter + " is not vowel!"));
        String result = (vowelString.contains("" + letter) ? "The letter " + letter + " is a vowel!" :
                "The letter " + letter + " is not a vowel!");
        System.out.println(result);

        // char[] vowelsArray = new char[5];
        // vowelsArray[0] = 'a';
        // vowelsArray[1] = 'e';
        // vowelsArray[2] = 'i';
        // vowelsArray[3] = 'o';
        // vowelsArray[4] = 'u';

        char[] vowelsArray = {'a', 'e', 'i', 'o', 'u'};
        boolean isVowel = false;
        for (char placeHolder : vowelsArray) {
            if (placeHolder == letter) {
                isVowel = true;
                System.out.println("The letter " + letter + " is a vowel!");
            }
        }
        if (!isVowel) {
            System.out.println("The letter " + letter + " is not a vowel!");
        }

        ArrayList<String> animals = new ArrayList<>();
        animals.add("Dog");
        animals.add("Lion");
        animals.add("Rhino");
        animals.add("Elephant");
        animals.add("Walrus");
        animals.add("Penguin");
        System.out.println("The array list animals contains: " + animals);
        System.out.println("The first index of animals contains: " + animals.get(0));
        animals.set(0, "Whale");
        String secondAnimal = animals.remove(1);
        System.out.println("The previous second element of animals was: " + secondAnimal);
        System.out.println("The updated array list animals contains: " + animals);
    }
}
