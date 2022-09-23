# MIT License
# 
# Copyright (c) 2022 Can Joshua Lehmann
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import owlkettle, owlkettle/dataentries

viewable App:
  celsius: float

proc to_celsius(fahrenheit: float): float = 5/9 * (fahrenheit - 32)
proc to_fahrenheit(celsius: float): float = 9/5 * celsius + 32

method view(app: AppState): Widget =
  result = gui:
    Window:
      title = "Temperature Converter"
      default_size = (600, 100)
      
      Box:
        orient = OrientX
        margin = 12
        spacing = 6
        
        Label(text = "Celsius")
        FormulaEntry:
          value = app.celsius
          proc changed(value: float) =
            app.celsius = value
        
        Label(text = "Fahrenheit")
        NumberEntry:
          value = app.celsius.to_fahrenheit
          proc changed(value: float) =
            app.celsius = value.to_celsius


brew(gui(App()))