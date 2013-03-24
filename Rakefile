task :default => [:test]

task :test do
  Rake::Task['spec']
  Rake::Task['cucumber']
end
task :spec do
  sh "rspec --out rspec-result.xml spec"
end
task :cucumber do
  sh "cucumber --tags ~@skipped"
end