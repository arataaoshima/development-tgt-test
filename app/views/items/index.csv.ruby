require 'csv'

CSV.generate do |csv|
  column_names = %w(name  user_id color_id)
  csv << column_names
  @items.each do |item|
    column_values = [
      item.name,
      item.user_id,
      item.color_id
    ]
    csv << column_values
  end
end
