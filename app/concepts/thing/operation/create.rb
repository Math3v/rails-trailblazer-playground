class Thing::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Thing, :new)
    step Contract::Build(constant: Thing::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :thing)
  step Contract::Persist()
end
