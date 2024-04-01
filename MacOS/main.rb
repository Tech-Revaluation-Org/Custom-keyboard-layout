# Define your custom key mappings
key_mappings = {
  'a' => 'q',
  'b' => 'w',
  # Add more
}

# Write the custom key mappings to a keyboard layout file
File.open('custom_layout.bundle/Contents/Resources/KeyboardLayout.plist', 'w') do |file|
  file.puts '<?xml version="1.0" encoding="UTF-8"?>'
  file.puts '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
  file.puts '<plist version="1.0">'
  file.puts '<dict>'
  file.puts '  <key>name</key>'
  file.puts '  <string>Custom Layout</string>'
  file.puts '  <key>keys</key>'
  file.puts '  <dict>'
  key_mappings.each do |from_key, to_key|
    file.puts "    <key>#{from_key}</key>"
    file.puts "    <string>#{to_key}</string>"
  end
  file.puts '  </dict>'
  file.puts '</dict>'
  file.puts '</plist>'
end

# Install the custom keyboard layout
system('sudo cp -R custom_layout.bundle /Library/Keyboard\ Layouts')

# Activate the custom keyboard layout
system('sudo defaults write /Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID "com.apple.keylayout.CustomLayout"')
