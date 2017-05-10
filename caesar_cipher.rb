require 'sinatra'

get '/' do
  erb :form
end

post '/' do
  message = params[:message] || ""
  offset = params[:offset] || 0
  new_message = caesar_cipher(message, offset.to_i)
  erb :form, :locals => {'new_message' => new_message, 'message' => message, 'offset' => offset}
end

def caesar_cipher text, offset
  text_array = text.split("")
  x = 0
  text_array.each do |letter|
    if letter =~ /[a-z]/
      new_letter = (letter.ord + offset)
      if new_letter.chr > 'z'
        new_letter -= 26
      end
      text_array[x] = new_letter.chr
    elsif letter =~ /[A-Z]/
      new_letter = (letter.ord + offset)
      if new_letter.chr > 'Z'
        new_letter -= 26
      end
    text_array[x] = new_letter.chr
    end
  x += 1
  end
  return text_array.join
end
