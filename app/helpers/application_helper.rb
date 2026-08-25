module ApplicationHelper
  def select_department
    Department.all
  end

  def select_country
    Country.all
  end

  def select_account
    Account.all
  end

  def print_error(errors, field)
    return if errors[field].blank?

    content_tag(
      :div,
      errors.full_messages_for(field).to_sentence,
      class: "text-danger"
    )
  end
end
