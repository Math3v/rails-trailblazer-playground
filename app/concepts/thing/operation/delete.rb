class Thing::Delete < Trailblazer::Operation
  step Model(Thing, :find_by)
  step :delete!

  def delete!(options, model:, **)
    model.destroy
  end
end
