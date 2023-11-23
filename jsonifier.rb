require 'json'

class JSONifier
  def load_data(filename)
    if File.exist?(filename) and File.size(filename) != 0
      file = File.read(filename)
      JSON.parse(file)
    else
      puts "The file '#{filename}' does not exist. Creating..."
      File.write(filename, '[]')
      []
    end
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end
end
