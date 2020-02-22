class Cat < ApplicationRecord
  def self.get_offset_selection(max_records, page_number)
    offset(max_records * page_number).limit(max_records)
  end
end
