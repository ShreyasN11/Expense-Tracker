class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[edit update destroy]

  def index
    @expenses = Expense.includes(:category)
                       .order(spent_on: :desc)

    @monthly_total = Expense
      .where(spent_on: Date.current.beginning_of_month..Date.current.end_of_month)
      .sum(:amount)

    @category_totals = Expense
      .joins(:category)
      .group("categories.name")
      .sum(:amount)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to expenses_path, notice: "Expense added successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "Expense updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: "Expense deleted successfully"
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(
      :amount,
      :description,
      :spent_on,
      :category_id
    )
  end
end
