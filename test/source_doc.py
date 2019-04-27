#!/usr/bin/env python


class MyClass(object):

    def first(self):
        return False

    def second(self):
        def nested_function(m, n):
            self.n = n
        self.first()

    # Comment

      # Comment

    @classmethod
    def third(self):
        return 0 == 0

    def fourth(self, bytes):
        """Fourth method comment line 1

        Fourth method comment line 2
        Fourth method comment line 3

        Fourth method comment line 4
        """
        foom = 2
        return foom

    def fifth(self, laaa, deee):
        """Fifth method comment"""
        bar = laaa
# Comment

    # Comment

        # Comment

            # Comment

        return (bar)

if __name__ == "__nope__":
    print('this should never happen')

# Def on multiple lines!
def sixth(a,
          b,
          c):
    """Sixth function comment line 1

       Sixth function comment line 2
    """

    return a
