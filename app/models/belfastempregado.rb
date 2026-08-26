class Belfastempregado < ApplicationRecord

  def self.to_csv(collection)
    CSV.generate(col_sep: ",") do |csv|
      csv << column_names
      collection.find_each do |record|
        csv << record.attributes.values
      end
    end
  end

end
