# Let's dance the Lambdada !

You'd like a easier function composition in ruby ? Lambdada is for you !

Now, composition is simple as adding functions !

## Installation

```
gem install lambdada
```

## Usage

**Composition:**

Now, you are able to compose lambdas by just adding them:

```ruby
require 'lambdada'

ADD2 = ->(a) { a + 2 }
DIV2 = ->(a) { a / 2 }

ADD_2_AND_DIV_BY_2 = DIV2 + ADD2

puts ADD_2_AND_DIV_BY_2.call(6)
# => 4
```

Any lambda returning nil in the chain of composition is considered as
a side effect less monitoring function:

```ruby
require 'lambdada'

PRINT = ->(*args) { puts(*args) }
SUM = ->(a, b) { a + b }
NEG = ->(a) { -a }

# That code set result to -5 and print 5
result = (NEG + PRINT + SUM)[2, 3]

```
**Currying:**

```ruby
require 'lambdada'

DIV = -> (divisor, dividend) { dividend / divisor }

DIV_BY_2 = DIV[2]

puts DIV_BY_2.call(8)
# => 4
```

**Both at the same time, baby !**

```ruby
require 'lambdada'

SUM = ->(a, b) { a + b }
MAP = ->(func) { ->(*args) { args.map { |arg| func.call(arg) } } }
TO_I = ->(a) { a.to_i }
TO_S = ->(a) { a.to_s }

(SUM + MAP[TO_I])['1', 2.0, '3']
# => 6 (Integer)

(SUM + MAP[TO_S])[1, 2, '3']
# => '123' (String)

```
