guard :shell do
  watch(%r{^.+\.feature$}) { |m| `date; cucumber --tags ~@skipped #{m[0]}`  }
end
