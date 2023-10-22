alias Takso.{Repo, Accounts.User}

[%{name: "Fred Flintstone", username: "fred", password: "parool", age:16},
 %{name: "Barney Rubble", username: "barney", password: "parool", age: 16}]
|> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)