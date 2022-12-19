public class FunctionalFaces {
    // If interface only has functions (no properties), it is called a functional interface
    @FunctionalInterface
    interface myInterface {
        double getPi();
    }
}
