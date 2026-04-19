class Meta(type):
    def __new__(cls, name, bases, attrs):
        print(f"Class {name} yaratilmoqda")
        if 'required_method' not in attrs:
            raise TypeError(f"Class {name} required_method metodini aniqlamagan")
        return super().__new__(cls, name, bases, attrs)

class Boshqaruvchi:
    def __init__(self):
        self.klasslar = []

    def klass_yaratish(self, name, bases, attrs):
        klass = Meta(name, bases, attrs)
        self.klasslar.append(klass)
        return klass

    def klass_lar(self):
        for klass in self.klasslar:
            print(klass)

class MyClass(metaclass=Meta):
    def required_method(self):
        pass

class MyClass2(metaclass=Meta):
    def required_method(self):
        pass

boshqaruvchi = Boshqaruvchi()
klass1 = boshqaruvchi.klass_yaratish('MyClass3', (), {'required_method': lambda self: None})
klas = type('MyClass4', (), {'required_method': lambda self: None})

try:
    class MyClass5(metaclass=Meta):
        pass
except TypeError as e:
    print(e)

boshqaruvchi.klass_lar()
print(MyClass())
print(MyClass2())
print(klass1())
print(klas())