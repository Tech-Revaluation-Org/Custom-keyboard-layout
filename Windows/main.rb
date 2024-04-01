# Define your custom key mappings
key_mappings = {
  'a' => 'q',
  'b' => 'w',
  # Add more 
}

# Write the custom key mappings to a keyboard layout file
File.open('custom_layout.klc', 'w') do |file|
  file.puts 'KBD US'
  key_mappings.each do |from_key, to_key|
    file.puts "  #{from_key}  #{to_key}"
  end
end

# Compile the keyboard layout file to a DLL
system('makekbd -l 0419 -u -n "Custom Layout" custom_layout.klc')

# Install the custom keyboard layout DLL
system('kbdutool install custom_layout.dll')

# Activate the custom keyboard layout
system('kbdutool activate custom_layout')
