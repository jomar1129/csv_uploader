class Story < ApplicationRecord
    def self.import(file)
        converter = lambda { |header| header.downcase }
        ::CSV.foreach(file.path, headers: true , encoding:'iso-8859-1:utf-8', header_converters: converter) do |row|
            Story.create! (row.to_hash)
        end
    end
end
