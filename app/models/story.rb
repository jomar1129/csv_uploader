class Story < ApplicationRecord
    def self.import(file)
        converter = lambda { |header| header.downcase }
        ::CSV.foreach(file.path, headers: true , skip_blanks: true , encoding:'iso-8859-1:utf-8' , header_converters: converter).reject do |row|
            puts row[0]
            # Story.create! (row.to_hash)  
        end
    end
end
