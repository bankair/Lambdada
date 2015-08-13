require 'lambdada/proc'

describe Proc do

  ADD2 = ->(a) { a + 2 }
  DIV = -> (divisor, dividend) { dividend / divisor }
  DIV2 = ->(a) { a / 2 }
  ADD_2_AND_DIV_BY_2 = DIV2 + ADD2
  PRINT = ->(*args) { puts(*args) }
  SUM = ->(a, b) { a + b }
  NEG = ->(a) { -a }
  MAP = ->(func) { ->(*args) { args.map { |arg| func.call(arg) } } }
  TO_I = ->(a) { a.to_i }
  TO_S = ->(a) { a.to_s }

  it { expect(DIV[2][10]).to eq DIV2[10] }
  it { expect((ADD2 + ADD2 + ADD2)[0]).to eq 6 }
  it { expect(ADD_2_AND_DIV_BY_2.call(2)).to eq 2 }
  it { expect((ADD2 + PRINT + ADD2)[0]).to eq (ADD2 + ADD2)[0] }
  it { expect((ADD2 + PRINT + ADD2).call 0).to eq (ADD2 + ADD2).call 0 }
  it { expect((SUM + MAP[TO_I])["13", 42]).to eq 55 }
  it { expect((SUM + MAP[TO_S])["13", 42]).to eq '1342' }

end
