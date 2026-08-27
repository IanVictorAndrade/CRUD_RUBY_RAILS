class ChartsController < ApplicationController

  def index
    @sales = Sale.all
    @chart_types = {
      'Line Chart': 'line',
      'Bar Chart': 'bar',
      'Pie Chart': 'pie',
      'Donut Chart': 'doughnut',
      'Area Chart': 'area',
      'Radar Chart': 'radar',
      'Polar Chart': 'polarArea'
    }
  end

  def fetch_sales_data
    render json: { months: Sale.pluck(:monthname), amount: Sale.pluck(:amount) }
  end

end
