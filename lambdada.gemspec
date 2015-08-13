# encoding: utf-8
#
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'lambdada/version'
Gem::Specification.new do |s|
  s.name = 'lambdada'
  s.version = Lambdada::Version::STRING
  s.summary = 'Ruby lambda composition (and currying) helpers'
  s.description = 'Add less verbose function composition and currying ability to ruby.'
  s.authors = ['Alexandre Ignjatovic']
  s.email = 'alexandre.ignjatovic@gmail.com'
  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |.*\.swp
    |Gemfile
    |Rakefile
    |\.rspec
    |\.gitignore
    |\.rubocop.yml
    )$}x
  end
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/bankair/lambdada'
  s.license = 'MIT'
end
