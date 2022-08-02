module Mac

  # Copies text to the clipboard.
  #
  # https://coderwall.com/p/qp2aha/ruby-pbcopy-and-pbpaste
  def self.copy(object)
    text = object.to_s
    IO.popen('pbcopy', 'w') { |f| f << text }
    text
  end

  # Retrieves text from the clipboard.
  def self.paste
    `pbpaste`.force_encoding 'utf-8'
  end

end
