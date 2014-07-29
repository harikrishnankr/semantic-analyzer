stk=[{:title=>"id",:id=>1},{:title=>"A",:id=>2},{:title=>"B",:id=>3},{:title=>"C",:id=>4}]
if h = stk.find { |h| h[:title] == "id" }
  h[:title]="hello"
else
  puts 'Not found!'
end
print stk
 	