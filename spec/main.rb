
require File.expand_path('spec/helper')
require 'Git_Repo'
require 'Bacon_Colored'


Dir.glob('spec/tests/*.rb').each { |file|
  require File.expand_path(file.sub('.rb', '')) if File.file?(file)
}
