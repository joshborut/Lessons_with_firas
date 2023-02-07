public class Greeter {
    public String msg;

    public Greeter(String word) {
        msg = word;
    }

    public String greeting() {
        return "hello world";
    }

    public void caller() {
        HelloWorld.printPassedData("mouse");
    }

    public void msgPrinter() {
        System.out.println(msg);
    }
}
