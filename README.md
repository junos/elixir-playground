# elixir-playground

* Installing Elixir - [http://elixir-lang.org/install.html](http://elixir-lang.org/install.html)
```bash
brew install elixir
```
* Installing Erlang
```bash
brew install erlang
```
* Installing Hex
```bash
mix local.hex
```
* Installing Phoenix
```bash
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
```

mix phoenix.new api_phoenix --no-brunch --no-ecto
mix deps.get

Run your Phoenix application:

    $ cd api_phoenix
    $ mix phoenix.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phoenix.server
