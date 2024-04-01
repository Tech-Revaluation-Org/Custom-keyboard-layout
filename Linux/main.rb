# Define your custom key mappings
key_mappings = {
  'a' => 'q',
  'b' => 'w',
  # Add more 
}

# Write the custom key mappings to an XKB configuration file
File.open('/usr/share/X11/xkb/symbols/custom', 'w') do |file|
  key_mappings.each do |from_key, to_key|
    file.puts "key <#{from_key.upcase}> { [ #{to_key} ] };"
  end
end

# Apply the custom keyboard layout
system('setxkbmap custom')
