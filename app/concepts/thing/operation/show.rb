class Thing::Show < Trailblazer::Operation
  step Model(Thing, :find_by)
end
