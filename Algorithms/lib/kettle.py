class Kettle(object):
    def __init__(self, make, price):
        self.make = make
        self.price = price
        self.on = False

    def switch_on(self):
        self.on = True


kenwood = Kettle("Kenwood", 9.99)
print("Make: " + kenwood.make + "\nPrice: " + str(kenwood.price))
print(f"Make: {kenwood.make}")
kenwood.price = 15
print("Make: " + kenwood.make + "\nPrice: " + str(kenwood.price))
hamlton = Kettle("Hamlton", 18)
print(hamlton.on)

# Classes in Python are dynamic
kenwood.voltage = 120
print(kenwood.voltage)
