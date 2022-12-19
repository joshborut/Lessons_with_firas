import java.util.ArrayList;

class Animals {
    protected String name;

    public void sleep() {
        System.out.println(name + " slept for 8 hours.");
    }
}

interface Mammals {
    void run();

    boolean hasFur();
}

// Implements requires initialization while extends adds from the superclass
class Lion extends Animals implements Mammals {
    @Override
    public void sleep() {
        System.out.println(name + " slept for 21 hours.");
    }

    public String hunt(String animal) {
        return name + " ate " + animal + " meat.";
    }

    @Override
    public void run() {
        System.out.println("You ran 8km!");
        System.out.println("You jumped 2m!");
    }

    @Override
    public boolean hasFur() {
        return true;
    }
}

class Chameleon extends Animals {
    public Chameleon(String name) {
        this.name = name;
    }

    public ArrayList<Integer> changeColors(String color) {
        ArrayList<Integer> colorSequence = new ArrayList();
        colorSequence.add(0);
        colorSequence.add(0);
        colorSequence.add(0);
        switch (color) {
            case "red":
                colorSequence.set(0, 255);
                break;
            case "green":
                colorSequence.set(1, 255);
                break;
            case "blue":
                colorSequence.set(2, 255);
                break;
            default:
                break;
        }
        // Integer[] finalArray = colorSequence.toArray(new Integer[colorSequence.size()]);
        // Integer[] integerArray = Arrays.stream(colorSequence.
        // toArray()).map(o -> (Integer) o).toArray(Integer[]::new);
        return colorSequence;
    }

    public ArrayList<String> allColors() {
        ArrayList<String> colors = new ArrayList();
        colors.add("red");
        colors.add("green");
        colors.add("blue");
        return colors;
    }
}

class Platypus extends Animals implements Mammals {
    @Override
    public void sleep() {
        System.out.println(name + " slept for 14 hours.");
    }

    @Override
    public void run() {
        System.out.println("You ran 1km!");
    }

    @Override
    public boolean hasFur() {
        System.out.println(name + " has fur.");
        return true;
    }
}

class Main {
    public static void main(String[] args) {
        Lion lion = new Lion();
        Chameleon chameleon = new Chameleon("George");
        chameleon.changeColors("blue").forEach(color -> System.out.print(color + ", "));
        chameleon.allColors().stream().map(color -> color.toUpperCase()).
                forEach(color -> System.out.print(color + ", "));
        System.out.println();
        chameleon.sleep();
        // lion.name = "Simba";
        System.out.println(lion.hunt(chameleon.name));
        lion.sleep();
        Platypus platypus = new Platypus();
        platypus.name = "perry";
        platypus.hasFur();
        lion.run();
    }
}
