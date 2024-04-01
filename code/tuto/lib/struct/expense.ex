defmodule Tuto.Struct.Expense do
  alias Tuto.Struct.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
          title: String.t(),
          date: Date.t() | nil,
          amount: number(),
          store: String.t()
        }

  @spec sample :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2022-02-01], amount: 32.34, store: "Carefour"},
      %Expense{title: "Mobile", date: ~D[2022-04-04], amount: 2.00, store: "Free"},
      %Expense{title: "Climbing", date: ~D[2023-11-30], amount: 390.00, store: "Vertical'Art"},
      %Expense{title: "Grocery", date: ~D[2022-12-01], amount: 122.34, store: "Franprix"}
    ]
  end

  @spec total([t]) :: number()
  def total(expenses) do
    expenses
    |> Enum.reduce(0, fn expense, acc -> expense.amount + acc end)
  end

  @spec sort_by_date([t]) :: [t]
  def sort_by_date(expenses) do
    expenses
    |> Enum.sort_by(& &1.date, Date)
  end

  @spec add_expense(t) :: [t]
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end

  def update_amount(title, amount) do
    [item] = Enum.filter(sample(), fn %{title: expense_title} -> expense_title == title end)
    new_item = %{item | amount: amount}
    [new_item | sample() |> List.delete(item)]
  end

  @users ["Coco", "Bob", "Louis", "Kantum", "Sam"]

  def authenticate(user) when user in @users, do: {:ok, "authorized"}
  def authenticate(_), do: {:error, "unauthorized"}

  def verify_password(user, _password) when user in @users, do: {:ok, "password verified"}
  def verify_password(_user, _password), do: {:error, "wrong password"}

  def login(user, password) do
    with {:ok, _auth_msg} <- authenticate(user),
         {:ok, _msg} <- verify_password(user, password) do
      {:ok, "#{user} logged in successfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
