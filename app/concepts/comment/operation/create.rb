class Comment::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Comment, :new)
    step Contract::Build(constant: Comment::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :comment)
  step Contract::Persist()
end
