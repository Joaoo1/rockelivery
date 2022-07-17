# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rockelivery.{Item, Order, Repo, User}

IO.puts("======= Inserting user... =======")

user = %User{
  age: 27,
  address: "Rua das bananeiras",
  cep: "1234567",
  cpf: "12345678910",
  email: "joao@banana.com",
  password: "123456",
  name: "João"
}

%User{id: user_id} = Repo.insert!(user)

IO.puts("======= Inserting items... =======")

item1 = %Item{
  category: :food,
  description: "Teste",
  price: Decimal.new("17.40"),
  photo: "priv/photo/test.png"
}

item1 = %Item{
  category: :food,
  description: "Teste 2",
  price: Decimal.new("11.40"),
  photo: "priv/photo/test2.png"
}

Repo.insert!(item1)
Repo.insert!(item2)

IO.puts("======= Inserting order... =======")

order = %Order{
  user_id: user_id,
  items: [item1, item1, item2],
  address: "Rua das bananeiras",
  comments: "Sem canela",
  payment_method: :money
}

Repo.insert!(order)
IO.puts("======= DONE! =======")
