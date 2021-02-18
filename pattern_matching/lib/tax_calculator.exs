defmodule TaxCalculator do
  @low_rate 0.05
  @med_rate 0.1
  @high_rate 0.15

  def calculate(salary) when salary <= 2000, do: 0
  def calculate(salary) when salary <= 3000, do: salary * @low_rate
  def calculate(salary) when salary <= 6000, do: salary * @med_rate
  def calculate(salary), do: salary * @high_rate
end

input = IO.gets "Enter your salary: "
case Integer.parse(input) do
  :error -> IO.puts "Invalid salary"
  {salary, _} ->
    tax = TaxCalculator.calculate(salary)
    IO.puts "You will pay #{tax} in tax"
end
