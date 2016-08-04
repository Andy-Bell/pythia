ESpec.configure fn(config) ->
  Code.require_file("spec/phoenix_helper.exs")
  config.before fn(tags) ->
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end
end
