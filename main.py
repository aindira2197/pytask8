class Meta(type):
    def __new__(cls, name, bases, dct):
        print(f"Yaratilayotgan class nomi: {name}")
        if 'required_method' not in dct:
            raise TypeError(f"Class {name} required_method nomli methodni oz ichiga olmagan")
        return super().__new__(cls, name, bases, dct)

class A(metaclass=Meta):
    def required_method(self):
        pass

class B(metaclass=Meta):
    pass

try:
    class C(metaclass=Meta):
        pass
except TypeError as e:
    print(e)

class D(metaclass=Meta):
    def required_method(self):
        print("required_method chaqirildi")

class E(metaclass=Meta):
    required_method = None

try:
    class F(metaclass=Meta):
        required_method = None
except TypeError as e:
    print(e)

class G(metaclass=Meta):
    def required_method(self):
        print("required_method chaqirildi")
    required_method = property(lambda self: self.required_method)

class H(metaclass=Meta):
    def __init__(self):
        self.required_method = self._required_method
    def _required_method(self):
        print("_required_method chaqirildi")

class I(metaclass=Meta):
    required_method = lambda self: None

class J(metaclass=Meta):
    required_method = staticmethod(lambda: None)

class K(metaclass=Meta):
    required_method = classmethod(lambda cls: None)