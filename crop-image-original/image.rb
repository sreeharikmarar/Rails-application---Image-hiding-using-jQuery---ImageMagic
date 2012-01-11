#img=ARGV[0]
#puts img
#array=[[130,130,200,50],[160,180,100,50]]
array.each do |lis|
    cord=lis[0].to_s + 'x' + lis[1].to_s + '+' + lis[2].to_s + '+' + lis[3].to_s
    system "convert #{img} -region #{cord} -fill white -colorize 100% #{img}"    
end
  


