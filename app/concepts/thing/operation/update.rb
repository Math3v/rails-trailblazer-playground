class Thing::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Thing, :find_by)
    step Contract::Build( constant: Thing::Contract::Create )
  end

  step Nested(Present)
  step Contract::Build( constant: Thing::Contract::Create )
  step Contract::Validate( key: :thing )
  step Contract::Persist()
end
