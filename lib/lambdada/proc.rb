# encoding: utf-8

##
# Extend the Proc class to ease composition and curry usage
module Massala
  ##
  # Compose two lambdas or proc into a third one.
  def +(other)
    proc { |*args| massala(*other.massala(*args) { args }) }
  end

  ##
  # Curry the current proc with one or several arguments.
  # If the result of the operation is nil, return the alternate
  # result provided in a block (if provided).
  def massala(*args)
    result = arity == -1 ? call(*args) : curry[*args]
    result = block_given? ? yield : args if result.nil?
    result
  end

  def self.included(klass)
    klass.send(:alias_method, :[], :massala)
  end
end

Proc.include(Massala)
