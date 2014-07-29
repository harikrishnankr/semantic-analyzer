def is_up?(word)
    !(word =~ /^[A-Z]*$/).nil?
end
#input_org=["FA-> id ","TB-> FA ","S-> TB ","FA-> id ","TB-> FA ","S-> S + TB "]
input_dup=["FA-> id ","TB-> FA ","S-> TB ","FA-> id ","TB-> FA ","S-> S + TB "]
#input_dup=["S-> id ","S-> id ","T-> S * S "]
Tree=Array.new
stack=Array.new
val=""
id_finder=0
for i in 0..(input_dup.length-1)
	inputvalue=input_dup[i]
	dup_array=inputvalue.split("->")
	id_finder=id_finder+1
	value={:id=>id_finder,:data=>dup_array[0],:parent_id=>nil}
	
	dup_inputvalue=dup_array[1]
	j=dup_inputvalue.length-2
	while j>=0
		f=0
		while dup_inputvalue[j]!=" "
			 val+=dup_inputvalue[j]
             j=j-1
			 f=1
		end
        if f==1
			j=j-1
		end
		val=val.reverse
		if(!is_up?(val))
			id_finder=id_finder+1
			Tree.push(:id=>id_finder,:data=>val,:parent_id=>value[:id])
		else 
		   if h=stack.find { |h| h[:data]==val&&h[:parent_id]==nil}
              v=stack.pop
              if r=Tree.find {|r| r==v}
              	r[:parent_id]=value[:id]
              end
            else
            	print "ERROR"
           end
	    end
        val=""
	end
	stack.push(value)
	Tree.push(value)
end
#print Tree
#print "\n"
root = {:id => 0, :data => '', :parent_id => nil}
map = {}

Tree.each do |e|
  map[e[:id]] = e
end

@@tree = {}

Tree.each do |e|
  pid = e[:parent_id]
  if pid == nil || !map.has_key?(pid)
    (@@tree[root] ||= []) << e
  else
    (@@tree[map[pid]] ||= []) << e
  end
end
def print_tree(item, level)
  items = @@tree[item]
  unless items == nil
    indent = level > 0 ? sprintf("%#{level * 2}s", " ") : ""
    items.each do |e|
      puts "#{indent}-#{e[:data]}"
      print_tree(e, level + 1)
    end
  end
end
print_tree(root, 0)