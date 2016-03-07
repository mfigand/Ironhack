1.upto(5) do |index|
  t = Tournament.create(
  name: "Tournament #{index}"
  )

  1.upto(8) do |index|
    t.players.create(
    name: "Player #{index}"
    )
  end

end
