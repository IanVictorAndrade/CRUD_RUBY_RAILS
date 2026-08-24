class Empregado < ApplicationRecord
  belongs_to :country
  belongs_to :department

  has_rich_text :notes

  after_initialize :do_after_initialize

  after_find :output_after_find

  after_destroy :print_destroyed_message



  scope :search, -> (query) {
    if query.present?
      left_joins(:department).where(
        "empregados.id LIKE ? OR firstname LIKE ? OR lastname LIKE ? OR departments.name LIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    else
      all
    end
  }

  private

  def do_after_initialize
    puts "AFTER INITIALIZE :- Empregado initialized with firstname: #{firstname},
      lastname: #{lastname}"
  end

  def output_after_find
    puts "AFTER FIND :- Empregado found with firstname: #{firstname},
      lastname: #{lastname}"
  end

  def print_destroyed_message
      puts "AFTER DESTROY :- Empregado destroyed!!"
      Backupempregado.create(firstname: self.firstname, lastname: self.lastname)
  end

end
